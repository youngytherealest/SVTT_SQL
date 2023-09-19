import pyodbc

server = '27.74.191.209'
database = 'SVTT'
username = 'sa'
password = 'Admin@2808'

def create_connection():
    conn = pyodbc.connect(f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password};CHARSET=UTF8')
    return conn