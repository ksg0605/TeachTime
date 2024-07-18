#  API 명세

#### Base URL:
```
https://api.example.com/v1
```
1. **GET /schedules**
    - 설명: 모든 수업 일정을 가져옵니다.
    - 요청 예시:
        ```http
        GET /schedules HTTP/1.1
        Host: api.example.com
        ```
    - 응답 예시:
        ```json
        [
            {
                "id": "1",
                "subject": "Mathematics",
                "teacher": "Mr. Lee",
                "date": "2023-10-10T09:00:00Z",
                "location": "Room 101"
            },
            ...
        ]
        ```

2. **GET /schedules/{id}**
    - 설명: 특정 수업 일정을 가져옵니다.
    - 요청 예시:
        ```http
        GET /schedules/1 HTTP/1.1
        Host: api.example.com
        ```
    - 응답 예시:
        ```json
        {
            "id": "1",
            "subject": "Mathematics",
            "teacher": "Mr. Lee",
            "date": "2023-10-10T09:00:00Z",
            "location": "Room 101"
        }
        ```

3. **POST /schedules**
    - 설명: 새로운 수업 일정을 추가합니다.
    - 요청 예시:
        ```http
        POST /schedules HTTP/1.1
        Host: api.example.com
        Content-Type: application/json

        {
            "subject": "Mathematics",
            "teacher": "Mr. Lee",
            "date": "2023-10-10T09:00:00Z",
            "location": "Room 101"
        }
        ```
    - 응답 예시:
        ```json
        {
            "id": "1",
            "subject": "Mathematics",
            "teacher": "Mr. Lee",
            "date": "2023-10-10T09:00:00Z",
            "location": "Room 101"
        }
        ```

4. **PUT /schedules/{id}**
    - 설명: 특정 수업 일정을 수정합니다.
    - 요청 예시:
        ```http
        PUT /schedules/1 HTTP/1.1
        Host: api.example.com
        Content-Type: application/json

        {
            "subject": "Advanced Mathematics",
            "teacher": "Mr. Lee",
            "date": "2023-10-10T10:00:00Z",
            "location": "Room 102"
        }
        ```
    - 응답 예시:
        ```json
        {
            "id": "1",
            "subject": "Advanced Mathematics",
            "teacher": "Mr. Lee",
            "date": "2023-10-10T10:00:00Z",
            "location": "Room 102"
        }
        ```

5. **DELETE /schedules/{id}**
    - 설명: 특정 수업 일정을 삭제합니다.
    - 요청 예시:
        ```http
        DELETE /schedules/1 HTTP/1.1
        Host: api.example.com
        ```
    - 응답 예시:
        ```json
        {
            "message": "Schedule deleted successfully."
        }
        ```
