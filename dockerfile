# Sử dụng Python 3.9 làm base image
FROM laudio/pyodbc:1.0.38

# Đặt thư mục làm thư mục làm việc cho ứng dụng
WORKDIR /app

# Sao chép tất cả các file trong thư mục hiện tại vào thư mục /app trên Docker
COPY . /app
# Cài đặt poppler cho thư viện pdf2image
RUN apt-get update

# Cài đặt các gói phụ thuộc để chạy ứng dụng
RUN pip install --no-cache-dir --upgrade pip && \
    pip install -r requirements.txt 
# Expose cổng 80 để ứng dụng có thể truy cập từ bên ngoài Docker
EXPOSE 8008

# Khởi động ứng dụng FastAPI
CMD ["uvicorn", "app.app:app", "--host", "0.0.0.0", "--port", "8008", "--workers", "2", "--reload"]