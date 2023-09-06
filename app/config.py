import pyodbc

server = 'giangpt-hass.duckdns.org'
database = 'SVTT'
username = 'sa'
password = 'Admin@2808'

def create_connection():
    conn = pyodbc.connect(f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password};CHARSET=UTF8')
    return conn