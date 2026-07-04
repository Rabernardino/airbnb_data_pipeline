
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
postgres_conn.insert_data(hosts, 'raw_hosts', schema='raw')
postgres_conn.insert_data(listings, 'raw_listings', schema='raw')
postgres_conn.insert_data(reviews, 'raw_reviews', schema='raw')
