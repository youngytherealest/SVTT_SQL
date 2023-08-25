import pandas as pd
import pyodbc
import psycopg2

server = '10.91.13.128'
database = 'SVTT'
username = 'sa'
password = 'Vnpt@123'

m_conn = pyodbc.connect(f'DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password};CHARSET=UTF8')
p_conn = psycopg2.connect(host="dpg-cjjbm5b37aks73f08n6g-a.singapore-postgres.render.com", database="svtt", user="root", password="EPDmJgQuSl0frtdPXTgCSqpMzjuoumtM")
# Đối với pyodbc
m_cursor = m_conn.cursor()
p_cursor = p_conn.cursor()

# nganh: dict = {
#     1: 'Công nghệ thông tin',
#     2: 'Công nghệ thông tin (CLC)',
#     3: 'Kỹ thuật phần mềm',
#     4: 'Kỹ thuật phần mềm (CLC)',
#     5: 'Hệ thống thông tin',
#     6: 'Mạng máy tính và Truyền thông',
#     7: 'Khoa học máy tính'
# }

# def find_key_by_value(dictionary, value):
#     for key, val in dictionary.items():
#         if val == value:
#             return key
#     return None

m_result = m_cursor.execute("SELECT * FROM SinhVien").fetchall()

for i in m_result:
    p_cursor.execute(f"CALL UpdateNhomThucTapBySVID('{str(i[1])}', '{i[11]}')")
    p_conn.commit()
    print(f'Inserted {i[1]}')