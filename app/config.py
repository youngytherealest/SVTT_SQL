import psycopg2

def create_connection():
    try:
        # Kết nối đến cơ sở dữ liệu PostgreSQL
        conn = psycopg2.connect(host="dpg-cjjbm5b37aks73f08n6g-a.singapore-postgres.render.com", database="svtt", user="root", password="EPDmJgQuSl0frtdPXTgCSqpMzjuoumtM")

        # Tạo một con trỏ
        cursor = conn.cursor()

        return cursor
    finally:
        # Đóng kết nối đến cơ sở dữ liệu PostgreSQL
        conn.close()
