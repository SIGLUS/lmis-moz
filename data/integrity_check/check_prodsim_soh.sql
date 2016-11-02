-- the following function will return the last soh in the key value table of a specified stockcard
CREATE OR REPLACE FUNCTION last_movement_soh_of_stockcard(stockcard_id INTEGER)
  RETURNS TEXT AS $last_soh$
DECLARE
  soh TEXT;
BEGIN
  SELECT
    valuecolumn,
    stock_card_entry_key_values.createddate
  FROM stock_card_entry_key_values
    JOIN stock_card_entries ON stock_card_entry_key_values.stockcardentryid = stock_card_entries.id
  WHERE stock_card_entries.stockcardid = stockcard_id AND keycolumn = 'soh'
  ORDER BY stockcardentryid DESC
  LIMIT 1
  INTO soh;
  RETURN soh;
END;
$last_soh$ LANGUAGE plpgsql;

-- the following sql statement will return stockcards whose soh mismatch the soh in the key value table
SELECT
  stock_cards.id                                 AS cardid,
  facilities.name,
  products.primaryname,
  products.code,
  totalquantityonhand                            AS cardsoh,
  last_movement_soh_of_stockcard(stock_cards.id) AS kvsoh
FROM stock_cards
  JOIN products ON stock_cards.productid = products.id
  JOIN facilities ON stock_cards.facilityid = facilities.id
WHERE totalquantityonhand != cast(last_movement_soh_of_stockcard(stock_cards.id) AS INTEGER);

-- the following function will return the last soh in the key value table of a specified lotitemkeyvalue
CREATE OR REPLACE FUNCTION last_movement_soh_of_lotonhandkeyvalue(lot_id INTEGER)
  RETURNS TEXT AS $last_soh$
DECLARE
  soh TEXT;
BEGIN
  SELECT
    valuecolumn,
    stock_card_entry_lot_items_key_values.createddate
  FROM stock_card_entry_lot_items_key_values
    JOIN stock_card_entry_lot_items ON stock_card_entry_lot_items_key_values.stockcardentrylotitemid = stock_card_entry_lot_items.id
  WHERE stock_card_entry_lot_items.lotid = lot_id AND keycolumn = 'soh'
  ORDER BY stockcardentryid DESC
  LIMIT 1
  INTO soh;
  RETURN soh;
END;
$last_soh$ LANGUAGE plpgsql;

-- the following sql statement will return lotonhand whose loh mismatch the loh in the key value table
SELECT
  quantityonhand,lotid,stock_cards.id, last_movement_soh_of_lotonhandkeyvalue(lots.id), lots.lotnumber
FROM lots_on_hand
  JOIN lots on lots_on_hand.lotid=lots.id
  JOIN stock_cards on lots_on_hand.stockcardid=stock_cards.id
WHERE quantityonhand != cast(last_movement_soh_of_lotonhandkeyvalue(lots.id) AS INTEGER);

--
SELECT sc.productid, t1.lotproductid, t1.lotid, t1.lotnumber, t1.expirationdate, sc.id
FROM stock_cards sc
JOIN
  (SELECT lots.productid AS lotproductid, lots.id AS lotid, lots.lotnumber AS lotnumber,
    lots.expirationdate AS expirationdate, lots_on_hand.stockcardid AS loh_sc
    FROM lots JOIN lots_on_hand ON lots_on_hand.lotid = lots.id) t1
ON sc.id = t1.loh_sc
WHERE sc.productid != t1.lotproductid

