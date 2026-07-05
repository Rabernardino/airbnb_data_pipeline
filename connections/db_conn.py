
# %%
import os
import pandas as pd
import sqlalchemy

from dotenv import load_dotenv

# %%
load_dotenv()

# %%
class postgres_connection():
    def __init__(self):
        
        self.host = os.getenv('DB_HOST')
        self.port = os.getenv('DB_PORT')
        self.user = os.getenv('DB_USER')
        self.password = os.getenv('DB_PASS')
        self.db = os.getenv('DATABASE')

        self.url = f"postgresql+psycopg2://{self.user}:{self.password}@{self.host}:{self.port}/{self.db}"

        self._create_engine()
        

    def _create_engine(self):
        
        try:
            self.engine = sqlalchemy.create_engine(self.url)

        except Exception as e:
            print(f'Fail on create the database connection {e}')
            raise e
        

    def insert_data(self, dataframe, table_name, schema):

        if self.engine is None:
            raise ConnectionError('Fail on making connection')


        try:
            with self.engine.begin() as conn:
                dataframe.to_sql(
                    name=table_name,
                    con=conn,
                    schema=schema,
                    if_exists='replace',
                    index=False,
                    chunksize=10000
                )

        except Exception as e:
            print(f'Fail on insert the data: {e}')

        

        

        