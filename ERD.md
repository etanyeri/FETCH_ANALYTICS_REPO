+---------------+
|     Users    |
+---------------+
| USER_KEY (PK) |
| USER_ID       |
| USER_STATE    |
| USER_ROLE     |
| CREATED_DATE  |
+---------------+
       |
       | 1:N
       |
       v
+---------------+
|    Receipts  |
+---------------+
| RECEIPT_KEY (PK) |
| USER_KEY (FK)    |
| RECEIPT_ID       |
| TOTAL_SPENT      |
| POINTS_EARNED    |
| RECEIPT_STATUS   |
+---------------+
       |
       | 1:N
       |
       v
+-----------------+
| Receipt_Items  |
+-----------------+
| RECEIPT_ITEM_KEY (PK) |
| RECEIPT_KEY (FK)      |
| PRODUCT_ID            |
| QUANTITY_PURCHASED    |
| PRICE                 |
| FINAL_PRICE           |
+-----------------+

+-------------+
|    Brands  |
+-------------+
| BRAND_KEY (PK) |
| BRAND_ID       |
| BRAND_NAME     |
| BRAND_CPG      |
| BRAND_CATEGORY |
+-------------+