import pyodbc

server = '10.91.13.128'
database = 'SVTT'
username = 'sa'
password = 'Vnpt@123'

def create_connection():
    conn = pyodbc.connect(f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password};CHARSET=UTF8')
    return conn