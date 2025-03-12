# Ứng dụng Web DSA

Đây là một ứng dụng web được xây dựng bằng Spring Boot.

## Bắt đầu

### Yêu cầu

- Java 22
- Maven

### Xây dựng dự án

Để xây dựng dự án, chạy lệnh sau:

```sh
./mvnw clean install
```

### Chạy ứng dụng

Để chạy ứng dụng, sử dụng lệnh sau:

```sh
./mvnw spring-boot:run
```

### Các API Endpoint

### Các API Endpoint

#### `POST /upload`

- **Mô tả**: Tải lên một tệp tin
- **Body**:
    ```json
    {
        "file": "binary data"
    }
    ```
- **Response**:
    ```json
    {
        "message": "File uploaded successfully",
        "fileId": "unique-file-id"
    }
    ```

#### `GET /files`

- **Mô tả**: Lấy danh sách các tệp tin đã tải lên
- **Response**:
    ```json
    {
        "files": [
            {
                "filename": "example.txt",
                "fileId": "unique-file-id"
            },
            ...
        ]
    }
    ```

#### `GET /files/{filename}`

- **Mô tả**: Tải xuống một tệp tin cụ thể
- **Response**: Tệp tin dưới dạng nhị phân

#### `DELETE /files/{filename}`

- **Mô tả**: Xóa một tệp tin cụ thể
- **Response**:
    ```json
    {
        "message": "File deleted successfully"
    }
    ```

#### `POST /process`

- **Mô tả**: Xử lý dữ liệu từ tệp tin đã tải lên
- **Body**:
    ```json
    {
        "fileId": "unique-file-id"
    }
    ```
- **Response**:
    ```json
    {
        "message": "File processed successfully",
        "result": "processing result"
    }
    ```

#### `GET /status`

- **Mô tả**: Kiểm tra trạng thái của ứng dụng
- **Response**:
    ```json
    {
        "status": "running",
        "uptime": "time in milliseconds"
    }
    ```

### Cấu trúc dự án

```
HELP.md
langchainddl.sql
mvnw
mvnw.cmd
pom.xml
src/
    main/
        java/
            com/
                example/
                    Langchain/
        resources/
            application.properties
    test/
        java/
            com/
                example/
uploads/
```

### Tài liệu tham khảo

* [Tài liệu chính thức của Apache Maven](https://maven.apache.org/guides/index.html)
* [Hướng dẫn Spring Boot Maven Plugin](https://docs.spring.io/spring-boot/3.3.2/maven-plugin)
* [Tạo một OCI image](https://docs.spring.io/spring-boot/3.3.2/maven-plugin/build-image.html)
* [Spring Web](https://docs.spring.io/spring-boot/docs/3.3.2/reference/htmlsingle/index.html#web)
* [Spring Data JPA](https://docs.spring.io/spring-boot/docs/3.3.2/reference/htmlsingle/index.html#data.sql.jpa-and-spring-data)
* [Spring Security](https://docs.spring.io/spring-boot/docs/3.3.2/reference/htmlsingle/index.html#web.security)

### Hướng dẫn

Các hướng dẫn sau minh họa cách sử dụng một số tính năng cụ thể:

* [Xây dựng một dịch vụ Web RESTful](https://spring.io/guides/gs/rest-service/)
* [Phục vụ nội dung Web với Spring MVC](https://spring.io/guides/gs/serving-web-content/)
* [Xây dựng dịch vụ REST với Spring](https://spring.io/guides/tutorials/rest/)
* [Truy cập dữ liệu với JPA](https://spring.io/guides/gs/accessing-data-jpa/)
* [Truy cập dữ liệu với MySQL](https://spring.io/guides/gs/accessing-data-mysql/)
* [Bảo mật ứng dụng Web](https://spring.io/guides/gs/securing-web/)
* [Spring Boot và OAuth2](https://spring.io/guides/tutorials/spring-boot-oauth2/)
* [Xác thực người dùng với LDAP](https://spring.io/guides/gs/authenticating-ldap/)

### Ghi chú về Maven Parent

Do thiết kế của Maven, các phần tử được kế thừa từ POM cha đến POM dự án. Trong khi hầu hết các kế thừa là ổn, nó cũng kế thừa các phần tử không mong muốn như `<license>` và `<developers>` từ POM cha. Để ngăn chặn điều này, POM dự án chứa các ghi đè trống cho các phần tử này. Nếu bạn chuyển thủ công sang một POM cha khác và thực sự muốn kế thừa, bạn cần xóa các ghi đè này.