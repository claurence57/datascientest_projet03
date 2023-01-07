import os
import psycopg2
from fastapi import FastAPI, HTTPException

# creating a FastAPI server
server = FastAPI(title='User API')

DB_HOST = os.environ.get('DB_HOST')
DB_HOST_PORT = os.environ.get('DB_HOST_PORT')
DB_NAME = os.environ.get('DB_NAME')
DB_USER = os.environ.get('DB_USER')
DB_PASSWORD = os.environ.get('DB_PASSWORD')

def connect():
    connection = psycopg2.connect(user=DB_USER,
                                  password=DB_PASSWORD,
                                  host=DB_HOST,
                                  port=DB_HOST_PORT,
                                  database=DB_NAME)
    return connection


@server.get('/status')
async def get_status():
    """Returns 1
    """
    return 1

@server.get('/dbconnexion')
async def get_dbconnexion():
    """Returns OK if connexion to database is working KO if not
    """
    try:
      connexion = connect()
      connexion.close()
      return "OK"
    except:
        raise HTTPException(
            status_code=404,
            detail=DB_USER + ',' + DB_PASSWORD + ',' + DB_HOST + ',' + DB_NAME )

@server.get('/categories')
async def get_categories():
    """Returns list of unique primary categories  if connexion to database is working KO if not
    """
    try:
      connexion = connect()
      cursor = connexion.cursor()
      cursor.execute("select distinct \"primaryCategories\" from datafinitielectronicsproductspricingdata order by 1;")
      categories = list(cursor.fetchall())
      connexion.close()
      return categories
    except:
        raise HTTPException(
            status_code=404,
            detail=DB_USER + ',' + DB_PASSWORD + ',' + DB_HOST + ',' + DB_NAME )

@server.get('/brands')
async def get_brands():
    """Returns list of unique brands  if connexion to database is working KO if not
    """
    try:
      connexion = connect()
      cursor = connexion.cursor()
      cursor.execute("select distinct \"brand\" from datafinitielectronicsproductspricingdata order by 1;")
      categories = list(cursor.fetchall())
      connexion.close()
      return categories
    except:
        raise HTTPException(
            status_code=404,
            detail=DB_USER + ',' + DB_PASSWORD + ',' + DB_HOST + ',' + DB_NAME )

if __name__ == "__main__":
    connexion = connect()
