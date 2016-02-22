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