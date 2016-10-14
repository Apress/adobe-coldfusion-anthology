<!--- The WRONG Way to Generate a Report --->

<cfif state eq "TX">
    <cfset salesTax = 0.0825>
<cfelse if . . .>
    <!--- else if for each state --->
</cfif>

<cfquery name="getOrders" datasource="#someDSN#">
    SELECT PRODUCT_ID, QTY_SOLD
    FROM ORDERS
    WHERE ORDER_DATE BETWEEN '2008-01-01' AND '2008-01-31'
</cfquery>

<cfset products = structNew()>
<cfoutput query="getOrders">
    <cfquery name="productInfo" datasource="#someDSN#">
        SELECT PRODUCT_COST, RETAIL_PRICE
        FROM PRODUCTS
        WHERE PRODUCT_ID = #getOrders.PRODUCT_ID#
    </cfquery>
    
    <cfif not structKeyExists( products, getOrders.PRODUCT_ID )>
        <cfset products[ getOrders.PRODUCT_ID ] = structNew()>
        <cfset products[ getOrders.PRODUCT_ID ].totalSold = getOrders.QTY_SOLD>
        <cfset products[ getOrders.PRODUCT_ID ].totalRetail = 
            products[ getOrders.PRODUCT_ID ].totalSold 
                * productInfo.RETAIL_PRICE>
    <cfelse>
        <cfset products[ getOrders.PRODUCT_ID ].totalSold = 
            products[ getOrders.PRODUCT_ID ].totalSold + getOrders.QTY_SOLD>
        <cfset products[ getOrders.PRODUCT_ID ].totalRetail = 
            products[ getOrders.PRODUCT_ID ].totalSold 
                * productInfo.RETAIL_PRICE>
    </cfif>
    <cfset products[ getOrders.PRODUCT_ID ].totalCost = 
       products[ getOrders.PRODUCT_ID ].totalSold * productInfo.PRODUCT_COST>

</cfoutput>



