SELECT 
       ID as payment_id
      ,ORDERID as order_id
      ,PAYMENTMETHOD as payment_method
      ,STATUS as payment_status
      ,AMOUNT
      ,CREATED
FROM dbo.stripe_payments