import pymysql
from app import app
from config import mysql
from flask import jsonify
from flask import flash, request
from flasgger import Swagger, swag_from

@app.route('/employee/create', methods=['POST'])
def create_employee():
    """
      post endpoint
      ---      
      tags:
        - Сотрудники
      parameters:
        - name: surname
          in: query
          type: varchar(45)
          required: true
          description: Фамилия
        - name: name
          in: query
          type: varchar(45)
          required: true
          description: Имя
        - name: patronymic
          in: query
          type: varchar(45)
          required: true
          description: Отчество
        - name: passport
          in: query
          type: varchar(45)
          required: true
          description: Серия и номер паспорта
        - name: issuedby
          in: query
          type: varchar(45)
          required: true
          description: Кем выдан
        - name: dateofissue
          in: query
          type: date
          required: true
          description: Дата выдачи
        - name: address
          in: query
          type: varchar(45)
          required: true
          description: Адрес
        - name: dateofbirth
          in: query
          type: date
          required: true
          description: Дата рождения
        - name: phonenumber
          in: query
          type: varchar(45)
          required: true
          description: Номер телефона
        - name: login
          in: query
          type: varchar(45)
          required: true
          description: Логин
        - name: password
          in: query
          type: varchar(45)
          required: true
          description: Пароль
        - name: type
          in: query
          type: integer
          required: true
          description: Номер типа сотрудника
        - name: room
          in: query
          type: integer
          required: true
          description: Номер помещения
      responses:
        500:
          description: Внутренняя ошибка сервера
        200:
          description: Сотрудник создан успешно!      
      """
    try:        
        _json = request.json
        _surname = _json['surname']
        _name = _json['name']
        _patronymic = _json['patronymic']
        _passport = _json['passport']
        _issuedby = _json['issuedby']
        _dateofissue = _json['dateofissue']
        _address = _json['address']
        _dateofbirth = _json['dateofbirth']
        _phonenumber = _json['phonenumber']
        _login = _json['login']
        _password = _json['password']
        _type = _json['type']
        _room = _json['room']
        
        if _surname and _name and _patronymic and _passport and _issuedby and _dateofissue and _address and _dateofbirth and _phonenumber and _login and _password and _type and _room and request.method == 'POST':
            conn = mysql.connect()
            cursor = conn.cursor(pymysql.cursors.DictCursor)		
            sqlQuery = "INSERT INTO employee(surname, name, patronymic, passport, issuedby, dateofissue, address, dateofbirth, phonenumber, login, password, type, room) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            bindData = (_surname, _name, _patronymic, _passport, _issuedby, _dateofissue, _address, _dateofbirth, _phonenumber, _login, _password, _type, _room)            
            cursor.execute(sqlQuery, bindData)
            conn.commit()
            cursor.close() 
            respone = jsonify('Employee created successfully!')
            respone.status_code = 200
            return respone
        else:
            return showMessage()
    except Exception as err:
        print(err)
    finally:
        
        conn.close()          
    
@app.route('/employee')
# @swag_from("stats.yml")
def employee():
    """
      get endpoint
      ---      
      tags:
        - Сотрудники
      responses:
        500:
          description: Внутренняя ошибка сервера
        200:
          description:  
          schema:
            id: employee
            properties:
              address:
                type: string
                description: Адрес
              dateofbirth:
                type: string
                description: Дата рождения
              dateofissue:
                type: string
                description: Дата выдачи паспорта
              issuedby:
                type: string
                description: Кем выдан паспорт
              login:
                type: string
                description: Логин
              name:
                type: string
                description: Имя
              passport:
                type: string
                description: Серия и номер паспорта
              password:
                type: string
                description: Пароль
              patronymic:
                type: string
                description: Отчество
              phonenumber:
                type: string
                description: Номер телефона
              room:
                type: integer
                description: Номер помещения
              surname:
                type: string
                description: Фамилия
              type:
                type: integer
                description: Тип сотрудника
              
      """
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute("SELECT * FROM employee")
        empRows = cursor.fetchall()
        respone = jsonify(empRows)
        respone.status_code = 200
        return respone
    except Exception as err:
        print(err)
    finally:
        cursor.close() 
        conn.close()  

@app.route('/employee/<string:employee_id>')
def employee_details(employee_id):
    """
      get endpoint
      ---      
      tags:
        - Сотрудники
      responses:
        500:
          description: Внутренняя ошибка сервера
        200:
          description: Number statistics
          schema:
            id: employee
          example:
            surname: Игнатьев
            name: Семён
            patronymic: Александрович
        404:
          description: Записи не найдены
      """
    try:
        if employee_id is None:
            respone = jsonify("Employee id cannot be empty!")
            respone.status_code = 400
        else:
            conn = mysql.connect()
            cursor = conn.cursor(pymysql.cursors.DictCursor)
            cursor.execute("SELECT * FROM employee WHERE passport =%s", employee_id)
            empRow = cursor.fetchone()
            respone = jsonify(empRow)
            respone.status_code = 200
        return respone
    except Exception as err:
        print(err)
    finally:
        cursor.close() 
        conn.close() 

@app.route('/employee/delete/<string:employee_id>', methods=['DELETE'])
def delete_employee(employee_id):
    """
      delete endpoint
      ---      
      tags:
        - Сотрудники
      responses:
        500:
          description: Внутренняя ошибка сервера
        200:
          description: Сотрудник успешно удалён!   
        404:
          description: Запись не найдена
      """
    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM employee WHERE passport =%s", (employee_id,))
        conn.commit()
        respone = jsonify('Employee deleted successfully!')
        respone.status_code = 200
        return respone
    except Exception as err:
        print(err)
    finally:
        cursor.close() 
        conn.close()



@app.route('/room')
def room():
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute("SELECT * FROM room")
        empRows = cursor.fetchall()
        respone = jsonify(empRows)
        respone.status_code = 200
        return respone
    except Exception as err:
        print(err)
    finally:
        cursor.close() 
        conn.close()  



@app.route('/employee/login', methods=['POST'])
def login():
    try:
        _json = request.json
        _login = _json['login']
        _password = _json['password']
        
        if _login and _password and request.method == 'POST':
            _login = _json['login']
            _password = _json['password']
            conn = mysql.connect()
            cursor = conn.cursor(pymysql.cursors.DictCursor)
            bindData = (_login, _password)
            cursor.execute("SELECT * FROM employee where login = %s and password = %s;", bindData)
            empRows = cursor.fetchall()
            respone = jsonify(empRows)
            respone.status_code = 200
            return respone
    except Exception as err:
        print(err)
    finally:
        cursor.close() 
        conn.close()  


###
### ERROR HANDLER
###

@app.errorhandler(404)
def showMessage(error=None):
    message = {
        'status': 404,
        'message': 'Record not found: ' + request.url,
    }
    respone = jsonify(message)
    respone.status_code = 404
    return respone
        
if __name__ == "__main__":
    app.run()
