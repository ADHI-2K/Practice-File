import oracledb
import pandas as pd

# Establish Oracle DB connection
conn = oracledb.connect(user="team29_adhesh", password="team29_adhesh", dsn="orcl-aws.c8sefhobaih4.ap-south-1.rds.amazonaws.com:1521/orcl")
cursor = conn.cursor()

# Load data and check for 'Quantity'
df = pd.read_csv("C:\\Users\\ADHESH S\\Desktop\\retail_sales_dataset.csv")

if 'Quantity' in df.columns:
    # Filter data
    df = df.dropna()[df['Quantity'] >= 3]
    print("Transformed DataFrame:", df)
    
    # If not empty, insert into DB
    if not df.empty:
        cursor.execute("INSERT INTO transformed_total_quantity (Total_Quantity) SELECT COUNT(Quantity) FROM test_data WHERE Quantity > 3")
        cursor.execute("INSERT INTO transformed_gender_by_category (gender) SELECT gender FROM test_data WHERE product_category = 'Electronics'")
        cursor.execute("INSERT INTO transformed_total_quantity_by_age_group (age, Total_Quantity) SELECT age, COUNT(Quantity) FROM test_data GROUP BY age")
        conn.commit()

# Close connection
cursor.close()
conn.close()

print("ETL process completed!")
