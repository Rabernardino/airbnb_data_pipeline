
# %%
import pandas as pd
from dotenv import load_dotenv
from connections.db_conn import postgres_connection

# %%
hosts = pd.read_csv('./data/hosts.csv', sep=',')
listings = pd.read_csv('./data/listings.csv', sep=',')
reviews = pd.read_csv('./data/reviews.csv', sep=',')

# %%
postgres_conn = postgres_connection()


# %%
hosts['created_at'] = pd.to_datetime(hosts['created_at'])
hosts['updated_at'] = pd.to_datetime(hosts['updated_at'])

listings['created_at'] = pd.to_datetime(listings['created_at']) 
listings['updated_at'] = pd.to_datetime(listings['updated_at']) 

reviews['date'] = pd.to_datetime(reviews['date'])


# %%
postgres_conn.insert_data(hosts, 'raw_hosts', schema='raw')
postgres_conn.insert_data(listings, 'raw_listings', schema='raw')
postgres_conn.insert_data(reviews, 'raw_reviews', schema='raw')

# %%
