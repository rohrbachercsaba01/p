from functools import wraps
import schedule
import json
import traceback
from flask import Flask, abort, render_template, request, redirect, send_file, url_for, jsonify, session, g, send_from_directory
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user
from flask_socketio import SocketIO, emit
import mysql
import mysql.connector
from mysql.connector import Error
from dataclasses import dataclass
import hashlib
import os
from datetime import date, datetime, timedelta
import datetime as datetimeanyad
from email.message import EmailMessage
import ssl
import smtplib
from dataclasses import dataclass
from flask_cors import CORS
import jsonpickle
import time
import random
from static.files import docxfiller, excelfiller
from static.files import csr as csrgenerator
from static.files import xmltool 
import calendar
from sqlalchemy import create_engine, MetaData
from sqlalchemy.schema import CreateTable
from decimal import Decimal
import base64
#import MySQLdb

#* ez az alap oldal
#* http://127.0.0.1:5000/base
#* ez a beo oldal
#* http://127.0.0.1:5000/beosite

#* email küldéshez, majd biztonságossá kell tenni
from_email = 'forgotpasssagem@gmail.com'
password = 'ycggpinbsczwbcir'


def generate_random_color():
    color = "#{:06x}".format(random.randint(0, 0xFFFFFF))
    while color == '#FF0000':
        color = "#{:06x}".format(random.randint(0, 0xFFFFFF))
    return color

def color_not_used(color, used_colors):
    return color not in used_colors

app = Flask(__name__)
socketio = SocketIO(app)


app.secret_key = "NewtonraRáesettEgyAlma" 

login_manager = LoginManager(app)
login_manager.init_app(app)
login_manager.login_view = 'login'

ssl_context = ssl.SSLContext(ssl.PROTOCOL_TLS_CLIENT)
ssl_context.options |= ssl.OP_NO_SSLv2 | ssl.OP_NO_SSLv3
ssl_context.minimum_version = ssl.TLSVersion.TLSv1_2
ssl_context.maximum_version = ssl.TLSVersion.TLSv1_3


#* csatlakoozás dbhez real CREATE USER 'username'@'localhost' IDENTIFIED BY '}mS!UU12LE0k'; mysql port 3306 vagy 33060
#PEM pass phrase: almafa

app.config['GENERATED_FILES_FOLDER'] = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'generated_files')

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'username'
app.config['MYSQL_PASSWORD'] = '}mS!UU12LE0k'
app.config['MYSQL_DB'] = 'weblap_db'

def first_and_last_day_of_month():
    today = datetimeanyad.date.today()
    
    first_day = today.replace(day=1)
    
    next_month = first_day.replace(month=first_day.month % 12 + 1, day=1)
    last_day = next_month - datetimeanyad.timedelta(days=1)
    
    return first_day, last_day

def currMonthMinusOne():
    today = datetimeanyad.date.today()
    first_day_of_current_month = datetimeanyad.datetime(today.year, today.month, 1)

    last_day_of_previous_month = first_day_of_current_month - datetimeanyad.timedelta(days=1)

    first_day_of_previous_month = datetimeanyad.datetime(last_day_of_previous_month.year, last_day_of_previous_month.month, 1)

    return first_day_of_previous_month, last_day_of_previous_month

def FALbyName(month_name, year=None):
    if year is None:
        year = datetime.now().year

    month_number = list(calendar.month_name).index(month_name)

    num_days = calendar.monthrange(year, month_number)[1]

    first_day = f'{year}-{month_number:02d}-01'
    last_day = f'{year}-{month_number:02d}-{num_days:02d}'
    
    return first_day, last_day

def get_dates_between(start_date, end_date):
        if type(start_date) is str:
            start_date = datetime.strptime(str(start_date), '%Y-%m-%d')
        if type(end_date) is str:
            end_date = datetime.strptime(str(end_date), '%Y-%m-%d')
        dates_list = []
        current_date = start_date
        while current_date <= end_date:
            dates_list.append(current_date.strftime('%Y-%m-%d'))
            current_date += timedelta(days=1)

        return dates_list

def is_weekend(date_str):
        if type(date_str) is str:
            date = datetime.strptime(str(date_str), '%Y-%m-%d')
        else:
            date = date_str
        if date.weekday() in [5, 6]:  # Saturday is 5, Sunday is 6
            return True
        else:
            return False

def cutOffWeekends(date_list): 
    weekday_ranges = []
    current_start_date = None

    for date in date_list:
        if is_weekend(date) is False:
            if current_start_date is None:
                current_start_date = date
            current_end_date = date
        else:
            if current_start_date is not None:
                weekday_ranges.append((current_start_date, current_end_date))
                current_start_date = None

    if current_start_date is not None:
        weekday_ranges.append((current_start_date, current_end_date))

    #for s, e in weekday_ranges:
        #s.strftime("%Y-%m-%d"), e.strftime("%Y-%m-%d")
    
    return weekday_ranges

def get_db():
    if 'db' not in g:
        g.db = mysql.connector.connect(
            host=app.config['MYSQL_HOST'], 
            user=app.config['MYSQL_USER'], 
            password=app.config['MYSQL_PASSWORD'], 
            database=app.config['MYSQL_DB'],
            ssl_disabled=False,
            
            #ssl_ca='C:\ProgramData\MySQL\MySQL Server 8.0\Data\ca.pem',
            #ssl_cert='C:\ProgramData\MySQL\MySQL Server 8.0\Data\server-cert.pem',
            #ssl_key='C:\ProgramData\MySQL\MySQL Server 8.0\Data\server-key.pem'
            #ssl_ca='/var/lib/mysql/ca.pem',
            #ssl_cert='/var/lib/mysql/server-cert.pem',
            #ssl_key='/var/lib/mysql/server-key.pem'
        )
    return g.db

def saveDBcontent():
    output_file = 'SavedDB.sql'
    host = app.config['MYSQL_HOST']
    user = app.config['MYSQL_USER']
    password = app.config['MYSQL_PASSWORD']
    database_name = app.config['MYSQL_DB']
    port = 3306
    cursor = get_db().cursor()

    engine = create_engine(
        f'mysql+mysqlconnector://{user}:{password}@{host}:{port}/{database_name}'
    )
    metadata = MetaData()

    metadata.reflect(engine)

    with open(output_file, 'w') as f:
        for table in metadata.sorted_tables:
            f.write(str(CreateTable(table).compile(engine)) + ';\n')

        for table in metadata.sorted_tables:
            cursor.execute(f"SELECT * FROM {table.name}")
            rows = cursor.fetchall()

            for row in rows:
                values = ', '.join(["'{}'".format(str(value).replace("'", "''")) if value is not None else 'NULL' for value in row])
                insert_statement = "INSERT INTO {} VALUES ({});\n".format(table.name, values)
                f.write(insert_statement)

    cursor.close()


@app.teardown_appcontext
def close_db(e=None):
    db = g.pop('db', None)
    if db is not None:
        db.close()

def query_db(query, args=(), one=False):
    cur = get_db().cursor(dictionary=True)
    cur.execute(query, args)
    if one:
        result = cur.fetchone()
    else:
        result = cur.fetchall()
    cur.close()
    return result

def execute_db(query, args=()):
    conn = get_db()
    cur = conn.cursor(dictionary=True)
    try:
        cur.execute(query, args)
        conn.commit()
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        conn.rollback()
    finally:
        cur.close()

@app.after_request
def apply_caching(response):
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "0"
    return response

class User(UserMixin):
    def __init__(self, id, username, role, color, firstname, lastname, holidays):
        self.id = id
        self.username = username
        self.role = role
        self.color = color
        self.firstname = firstname
        self.lastname = lastname
        self.holidays = holidays

@login_manager.user_loader
def load_user(user_id):
    user_dict = query_db("SELECT id, userName, role_id, color, firstName, lastName, holidays FROM users WHERE id = %s", (user_id,), one=True)
    if user_dict:
        return User(id=user_dict['id'], username=user_dict['userName'], role=user_dict['role_id'], color=user_dict['color'], firstname=user_dict['firstName'], lastname=user_dict['lastName'], holidays=user_dict['holidays'])
    return None

def get_used_colors():
    color_list = query_db("SELECT color FROM users", (), one=False)
    return color_list

def format_time(time_str):
    hours, minutes = time_str.split(":")
    return f"{hours.zfill(2)}:{minutes}"

class DecimalEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, Decimal):
            return str(obj)  # or float(obj)
        return super(DecimalEncoder, self).default(obj)

@app.route('/logout', methods=['GET', 'POST'])
@login_required
def logout():
    logout_user()
    if request.method == 'POST':
        return jsonify({'status': 'success', 'message': 'Logged out successfully'}), 200
    else:
        return redirect(url_for('login'))

def role_required(*roles):
    def decorator(func):
        @wraps(func)
        def decorated_view(*args, **kwargs):
            if not current_user.is_authenticated or current_user.role not in roles:
                abort(403)
            return func(*args, **kwargs)
        return decorated_view
    return decorator

@socketio.on('connect')
def handle_connect():
    print('Client connected')

@socketio.on('disconnect')
def handle_disconnect():
    print('Client disconnected')

@socketio.on('connect', namespace='/admin')
def admin_connect():
    is_admin = current_user.role
    if is_admin != '1':
        return False
    print('Admin connected')

def is_holidayBence(date):
    result = query_db("SELECT COUNT(*) as count FROM fixed_holidays WHERE holidayDate = %s", (date,), one=True)
    return result['count'] > 0

def deleteFatmeneti(start_date, end_date, name, db):
    start_date = datetime.strptime(str(start_date), '%Y-%m-%d')
    end_date = datetime.strptime(str(end_date), '%Y-%m-%d')
    
    current_date = start_date
    if db == "atmeneti":
        while current_date <= end_date:
            deletable = current_date.strftime('%Y-%m-%d')
            execute_db("DELETE FROM atmeneti_beosztas WHERE currDate = %s AND userName = %s", (deletable, name))
            current_date += timedelta(days=1)
    elif db == "beosztas":
        while current_date <= end_date:
            deletable = current_date.strftime('%Y-%m-%d')
            execute_db("DELETE FROM beosztas WHERE currDate = %s AND userName = %s", (deletable, name))
            current_date += timedelta(days=1)

#* regisztráció
@app.route('/register', methods=['GET', 'POST'])
def create_user():
    username = current_user.username
    print(username)
    if request.method == 'POST':
        salt = os.urandom(16)
        username = request.form['username']
        if not username.__contains__('@sagemcom.hu'):
            return render_template("register.html", error_message="E-mail address not correct!")
        password = request.form['password']
        yearofbirth = request.form['yearOfBirth']
        yearofbirth = datetime.strptime(yearofbirth, "%Y").year
        if len(str(yearofbirth)) != 4:
            return render_template("register.html", error_message="Year of birth not correct!")
        numofchild = request.form['numOfChild']
        worktime = request.form['workTime']
        lastName = request.form['lastName']
        firstName = request.form['firstName']
        salted_password = salt + password.encode('utf-8')
        hashed_password = hashlib.sha256(salted_password).hexdigest()
    
        while True:
            color = generate_random_color()
            if color_not_used(color, get_used_colors()):
                user_color = color
                break
        try:
            execute_db("INSERT INTO users (userName, password_hash, salt, yearOfBirth, numOfChild, workTime, lastName, firstName, color, role_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (username, hashed_password, salt.hex(), yearofbirth, numofchild, worktime, lastName, firstName, user_color,'3'))
            return redirect(url_for('login'))
        except mysql.connector.Error as err:
            return render_template('register.html', error_message="Registration failed: " + str(err))
    return render_template('register.html', username = username)

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        user = query_db("SELECT * FROM users WHERE userName = %s", (username,), one=True)
        if user:
            fName = user['firstName']
            lName = user['lastName']
            numOfChild = user['numOfChild']
            workTime = user['workTime']
            yearofbirth = user['yearOfBirth']
            stored_password_hash = user['password_hash']
            holidays = user['holidays']
            role_id = user['role_id']
            session['username'] = username
            session['fullname'] = fName + ' ' + lName
            session['color'] = user['color']
            session['firstName'] = fName
            session['lastName'] = lName
            session['yearOfBirth'] = yearofbirth
            session['holidays'] = holidays
            session['role_id'] = role_id
            session['numOfChild'] = numOfChild
            session['workTime'] = workTime

            user_salt = bytes.fromhex(user['salt'])
            salted_pass = user_salt + password.encode('utf-8')
            hashed_password = hashlib.sha256(salted_pass).hexdigest()
            if hashed_password == stored_password_hash:
                user_obj = User(id=user['id'], username=user['userName'], role=user['role_id'], color=user['color'], firstname=user['firstName'], lastname=user['lastName'], holidays=user['holidays'])
                login_user(user_obj)
                return redirect(url_for('fullbeo'))
        return render_template('login.html', error_message="Invalid username or password.")
    else:
        return render_template('login.html')


#* jelszóváltoztatás
@app.route('/pass_change', methods=['GET','POST'])
@login_required
def change_password():
    if request.method == 'POST':
        username = request.form['username']
        old_password = request.form['old_password']
        new_password = request.form['new_password']
        confirm_password = request.form['confirm_password']
        try:
            user = query_db("SELECT * FROM users WHERE userName = %s", (username,), one=True)
            if user is not None:
                stored_password_hash = user['password_hash']
                user_salt = bytes.fromhex(user['salt'])
                salted_old_password = user_salt + old_password.encode('utf-8')
                hashed_old_password = hashlib.sha256(salted_old_password).hexdigest()
                if hashed_old_password == stored_password_hash:
                    if new_password == confirm_password:
                        new_salt = os.urandom(16)
                        salted_new_password = new_salt + new_password.encode('utf-8')
                        new_password_hash = hashlib.sha256(salted_new_password).hexdigest()
                        execute_db("UPDATE users SET password_hash = %s, salt = %s WHERE userName = %s", (new_password_hash, new_salt.hex(), username))
                        return render_template("login.html", error_message="Password changed successfully.")
                    else:
                        return render_template('pass_change.html', error_message="New password and confirmation do not match.")
                else:
                    return render_template('pass_change.html', error_message="Invalid old password.")
            else:
                return render_template('pass_change.html', error_message="Invalid username.")
        except mysql.connector.Error as err:
            return render_template('pass_change.html', error_message="Error: " + err)
    else:
        return render_template('pass_change.html')

#* jelszó elfelejtése
@app.route('/forgot_pass', methods=['GET', 'POST'])
def forgot_password():
    if request.method == 'POST':
        username = request.form['username']
        try:
            user = query_db("SELECT * FROM users WHERE userName = %s", (username,), one=True)
            if user is not None:
                user_salt = bytes.fromhex(user['salt'])
                new_password = 'Almafa12'
                new_password_hash = hashlib.sha256(user_salt + new_password.encode('utf-8')).hexdigest()
                execute_db("UPDATE users SET password_hash = %s WHERE userName = %s", (new_password_hash, username))
                user = query_db("SELECT * FROM users WHERE userName = %s", (username,), one=True)
                send(user['userName'])
                return render_template("login.html", error_message="Password changed successfully.")
            else:
                return render_template('forgot_pass.html', error_message="Invalid username.")
        except mysql.connector.Error as err:
            return render_template('forgot_pass.html', error_message="Error: " + err)
    else:
        return render_template('forgot_pass.html')

@app.route("/")
def login_page():
    return render_template("login.html")

#* kezdőoldal
@app.route("/base")
@login_required
def home_page():
    return render_template("base.html")

@app.route("/berszamf")
@login_required
def berszamf_page():
    username = current_user.username
    print(username)
    return render_template("berszamf.html", username = username)

@app.route('/beosztas')
@login_required
def beosztas():
    return render_template('beosztas.html')

@app.route('/tools')
@login_required
def tools():
    return render_template('usefultools.html')

@app.route('/profile')
@login_required
def profile(): #approverUser = query_db("SELECT u.userName FROM users as u join szabadsag as sz WHERE u.id = sz.approvedBy AND sz.userName = %s", [username])
    try:
        username = current_user.username
        user_holidays = []
        holidays = query_db("SELECT startDate, endDate, szabadsagType FROM szabadsag WHERE userName = %s", [username])
        user_requested_holidays = query_db("SELECT startDate, endDate FROM atmeneti_szabadsag WHERE userName = %s", [username])
        realtimeholidays = query_db("SELECT holidays from users WHERE userName = %s", [username])

        for dict in holidays:
            approverUser = query_db("SELECT u.userName FROM users as u join szabadsag as sz WHERE u.id = sz.approvedBy AND sz.userName = %s AND sz.startDate = %s AND sz.endDate = %s", [username, dict['startDate'], dict['endDate']])
            dict['approver'] = approverUser[0]['userName']
            user_holidays.append(dict)

        print(user_holidays)
        return render_template('profile.html', user_holidays=user_holidays, user_requested_holidays=user_requested_holidays, realtimeholidays = realtimeholidays)
    except Exception as e:
        print("There was an error accured during loading you're profile", e)


@app.route('/update_profile', methods=['POST'])
def update_profile():
    username = current_user.username
    data = request.json
    numofchild = data['numOfChild']
    worktime = data['workTime']
    try:
        execute_db("UPDATE users SET numOfChild = %s, workTime = %s WHERE userName = %s", (numofchild, worktime, username))
        return jsonify({'status': 'success'})
    except mysql.connector.Error as err:
        print("Database error:", err)
        return jsonify({'status': 'error', 'message': str(err)}), 500


@app.route('/delete_schedule', methods=['POST'])
def delete_schedule():
    deletableData = request.get_json()
    role_id = current_user.role
    if role_id != 1:
        print(deletableData)
        name = deletableData['name']
        date = deletableData['date']
        startHour = deletableData['startHour']
        try: 
            schedule_id = query_db("SELECT id FROM atmeneti_beosztas WHERE fullName = %s AND currDate = %s AND startH = %s", (str(name), str(date), str(startHour),), one=True)
            if schedule_id:
                execute_db("DELETE FROM atmeneti_beosztas WHERE id = %s AND fullName = %s AND currDate = %s AND startH = %s", (int(schedule_id['id']), name, date, startHour,))
                execute_db("DELETE FROM notifications WHERE referenceId = %s", (schedule_id['id'],))
        except mysql.connector.Error as err:
                print("Sikertelen csatlakozás! " + err)
                return "Sikertelen csatlakozás! " + err
        return jsonify({'status': 'success'})
    elif role_id == 1:
        name = deletableData['name']
        date = deletableData['date']
        startHour = deletableData['startHour']
        try: 
            execute_db("DELETE FROM beosztas WHERE fullName = %s AND currDate = %s AND startH = %s", (name, date, startHour,))
        except mysql.connector.Error as err:
                print("Sikertelen csatlakozás! " + err)
                return "Sikertelen csatlakozás! " + err
        return jsonify({'status': 'success'})

@app.route('/save_schedule', methods=['POST'])
def save_schedule():
    data = request.get_json()
    username = current_user.username
    fullname = current_user.firstname + ' ' + current_user.lastname
    role_id = current_user.role
    user_id = current_user.id
    temp_schedule = {}
    if role_id != 1:
        admins = query_db("SELECT id FROM users WHERE role_id = 1", (), one=False)
        admin_ids = [admin['id'] for admin in admins]
        admin_ids = json.dumps(admin_ids)
        fullName = data['username']
        schedules = data['schedule']
        for schedule in schedules:
            date = schedule['date']
            crackable = schedule['holidaycrack']
            print(crackable)
            if is_holidayBence(date):
                print(f"{date} ünnepnap, kihagyás.")
                continue  # Ha ünnepnap, kihagyjuk ezt a bejegyzést
                
            startHour = schedule['startHour']
            startHour = format_time(startHour)
            endHour = schedule['endHour']
            endHour = format_time(endHour)
            workSpot = schedule['workSpot']
            try:
                execute_db("insert into atmeneti_beosztas (userName, fullName, currDate, startH, endH, workSpot) values (%s, %s, %s, %s, %s, %s)", (username, fullName, date, startHour, endHour, workSpot))
                id = query_db("SELECT id FROM atmeneti_beosztas WHERE userName = %s and fullName = %s and currDate = %s and startH = %s and endH = %s", (username, fullName, date, startHour, endHour), one=True)
                id = id['id']
                message = f'Új beosztás érkezett! Azonosító: {fullName}: {date} - {startHour}-{endHour}'
                execute_db('insert into notifications ( notificationType, senderId, receivers, referenceId, message) values (%s, %s, %s, %s, %s)', ('beosztas', user_id, admin_ids, str(id), message))

                if fullName not in temp_schedule:
                    temp_schedule[fullName] ={}
                if date not in temp_schedule[fullName]:
                    temp_schedule[fullName][date] = {}
                temp_schedule[fullName][date] = {'startHour': startHour, 'endHour': endHour}
            except mysql.connector.Error as err:
                print("Sikertelen csatlakozás! " + str(err))
                return "Sikertelen csatlakozás! " + err
        # itt kell majd az értesítéseket kezelni 
        return jsonify({'status': 'success'})
    elif role_id == 1:
        fullName = data['username']
        schedules = data['schedule']
        for schedule in schedules:
            date = schedule['date']
            if is_holidayBence(date):
                print(f"{date} ünnepnap, kihagyás.")
                continue  # Ha ünnepnap, kihagyjuk ezt a bejegyzést
            startHour = schedule['startHour']
            startHour = format_time(startHour)
            endHour = schedule['endHour']
            endHour = format_time(endHour)
            workSpot = schedule['workSpot']
            try:
                execute_db("insert into beosztas (userName, fullName, currDate, startH, endH, workSpot, approvedBy) values (%s, %s, %s, %s, %s, %s, %s)", (username, fullName, date, startHour, endHour, workSpot, user_id))
            except mysql.connector.Error as err:
                print("Sikertelen csatlakozás! " + err)
                return "Sikertelen csatlakozás! " + err
        return jsonify({'status': 'success'})

@app.route('/get_schedule', methods=['GET'])
def get_schedule():
    try:
        userName = current_user.username
        aproved_schedule = query_db("SELECT b.fullName, b.currDate, b.startH, b.endH, b.workSpot, u.color FROM beosztas as b join users as u where b.userName = u.userName and b.userName = %s", (userName,))
        unaproved_schedule = query_db("SELECT a.fullName, a.currDate, a.startH, a.endH, a.workSpot, 'red' as color FROM atmeneti_beosztas as a join users as u where a.userName = u.userName and a.userName = %s", (userName,))
        schedules = {}
        for row in aproved_schedule + unaproved_schedule:
            fullName = row['fullName']
            startHour = row['startH']
            startHour = (datetime.min + startHour).time().strftime('%H:%M')
            endHour = row['endH']
            endHour = (datetime.min + endHour).time().strftime('%H:%M')
            if fullName not in schedules:
                schedules[fullName] = []
            schedules[fullName].append({
                'date': row['currDate'].isoformat(),
                'startHour': str(startHour),
                'endHour': str(endHour),
                'color': row['color'],
                'workSpot': str(row['workSpot']),
            })
        return jsonify(schedules)
    except Error as e:
        print(f"Error reading data from MySQL table: {e}")
        return jsonify({}), 500
    
@app.route('/get_attendance', methods=['GET', 'POST'])
def get_attendance():
    try:
        rows = query_db("SELECT * FROM beosztas WHERE userName = %s AND currDate BETWEEN %s AND %s ORDER BY currDate",(session['username'], first_and_last_day_of_month()[0], first_and_last_day_of_month()[1]))
 
        schedules = {}
        for row in rows:
            username = row['userName']
            if username not in schedules:
                schedules[username] = []
            schedules[username].append({
                'date': row['currDate'].isoformat(),
                'startHour': str(row['startH']),
                'endHour': str(row['endH']),

            })
            
        return send_file(docxfiller.fillAttendance(schedules), as_attachment=True)
    except Error as e:
        print(f"Error reading data from MySQL table: {e}")
        return jsonify({}), 500

@app.route('/get_full_attendance', methods=['GET', 'POST'])
def get_full_attendance():
    try:
        rows = query_db("SELECT fullName, currDate, startH, endH FROM beosztas WHERE currDate BETWEEN %s AND %s ORDER BY fullName, currDate", (first_and_last_day_of_month()[0], first_and_last_day_of_month()[1]))
        
        schedules = {}
        for row in rows:
            username = row['fullName']
            if username not in schedules:
                schedules[username] = []
            schedules[username].append({
                'date': row['currDate'].isoformat(),
                'startHour': str(row['startH']),
                'endHour': str(row['endH']),
            })
        
        hdays = query_db("SELECT fullName, startDate, endDate, szabadsagType FROM szabadsag WHERE startDate >= %s AND endDate <= %s ORDER BY fullName, startDate", (first_and_last_day_of_month()[0], first_and_last_day_of_month()[1]))

        holidays = {}
        for hday in hdays:
            username = hday['fullName']
            if username not in holidays:
                holidays[username] = []
            holidays[username].append({
                'startDate': hday['startDate'].isoformat(),
                'endDate': hday['endDate'].isoformat(),
                'szabadsagType': str(hday['szabadsagType']),
            })
        print(excelfiller.fillFullAttendance(schedules, holidays))
        return send_file(excelfiller.fillFullAttendance(schedules, holidays), as_attachment=True)
    except Error as e:
        print(f"Error reading data from MySQL table: {e}")
        return jsonify({}), 500

@app.route('/submit_holiday_request', methods=['POST'])
def submit_holiday_request():
    data = request.get_json()
    print(data)
    username = current_user.username
    fullname = current_user.firstname + ' ' + current_user.lastname
    role_id = current_user.role
    user_id = current_user.id
    startDate = data['startDate']
    endDate = data['endDate']

    print(f'startDate: {startDate}, endDate: {endDate}')
    #! 
    holidaysCount = (datetime.strptime(endDate, '%Y-%m-%d') - datetime.strptime(startDate, '%Y-%m-%d')).days
    print(f'szabadnapok: {int(holidaysCount)}')
  
    if startDate > endDate:
        return jsonify({'status': 'error', 'message': 'End date must be after start date'}), 400
    remaining_holidays = current_user.holidays

    if remaining_holidays <= 0:
        return jsonify({'status': 'error', 'message': 'No remaining holidays'}), 400
    overlapping_request = query_db(
        "SELECT COUNT(*) AS count FROM atmeneti_szabadsag WHERE userName = %s AND ((startDate BETWEEN %s AND %s) OR (endDate BETWEEN %s AND %s) OR (startDate <= %s AND endDate >= %s))",
        (username, startDate, endDate, startDate, endDate, startDate, endDate),
        one=True
    )

    overlapping_approved_request = query_db(
        "SELECT COUNT(*) AS count FROM szabadsag WHERE userName = %s AND ((startDate BETWEEN %s AND %s) OR (endDate BETWEEN %s AND %s) OR (startDate <= %s AND endDate >= %s))",
        (username, startDate, endDate, startDate, endDate, startDate, endDate),
        one=True
    )

    if role_id != 1:
 
        try:
            if overlapping_request['count'] > 0:

                return jsonify({'status': 'error', 'message': 'Holiday request overlaps with existing request'}), 400
            
            if overlapping_approved_request['count'] > 0:

                return jsonify({'status': 'error', 'message': 'Holiday request overlaps with existing approved request'}), 400
            execute_db("insert into atmeneti_szabadsag (userName, fullName, startDate, endDate) values (%s, %s, %s, %s)", (username, fullname, startDate, endDate))

            admins = query_db("SELECT id FROM users WHERE role_id = 1", (), one=False)

            admin_ids = [admin['id'] for admin in admins]
            admin_ids = json.dumps(admin_ids)

            id = query_db("SELECT id FROM atmeneti_szabadsag WHERE userName = %s and fullName = %s and startDate = %s and endDate = %s", (username, fullname, startDate, endDate), one=True)

            id = id['id']
            message = f'{fullname} szabadságot kért! Kezdés: {startDate}, Vége: {endDate}'
            holidaysCount = int((datetime.strptime(endDate, '%Y-%m-%d') - datetime.strptime(startDate, '%Y-%m-%d')).days)

            execute_db('insert into notifications ( notificationType, senderId, receivers, referenceId, message) values (%s, %s, %s, %s, %s)', ('szabadsag', user_id, admin_ids, str(id), message))
        except mysql.connector.Error as err:
            print("Database error:", err)
            return jsonify({'status': 'error', 'message': str(err)}), 500
        return jsonify({'status': 'success'})
    elif role_id == 1:
        try:
            if overlapping_approved_request['count'] > 0:
                print('overlap approved')
                return jsonify({'status': 'error', 'message': 'Holiday request overlaps with existing approved request'}), 400
            print(f'startDate: {startDate}, endDate: {endDate}')
            #!
            #holidaysCount =int((datetime.strptime(endDate, '%Y-%m-%d') - datetime.strptime(startDate, '%Y-%m-%d')).days)
            list_of_dates = get_dates_between(startDate, endDate)
            weekdays = cutOffWeekends(list_of_dates)

            for start, end in weekdays:
                holidaysCount =int((datetime.strptime(end, '%Y-%m-%d') - datetime.strptime(start, '%Y-%m-%d')).days)
                execute_db("INSERT INTO szabadsag (userName, fullName, startDate, endDate, szabadsagType, approvedBy) values (%s, %s, %s, %s, %s, %s)", (username, fullname, start, end, "Szabadság", user_id))
                execute_db("UPDATE users SET holidays = holidays - %s WHERE userName = %s", (holidaysCount, username))
            return jsonify({'status': 'success'})
        except mysql.connector.Error as err:
            print("Database error:", err)
            return jsonify({'status': 'error', 'message': str(err)}), 500

@app.route('/generate_csr', methods=['POST'])
def generate_csr():
    try:
        number = request.form['registrationNumber']

        csr_path, key_path = csrgenerator.generateCSR(number)
    
        with open(csr_path, 'rb') as csr_file:
            csr_content = base64.b64encode(csr_file.read()).decode('utf-8')
    
        with open(key_path, 'rb') as key_file:
            key_content = base64.b64encode(key_file.read()).decode('utf-8')
    
        return jsonify(csr=csr_content, csr_filename=os.path.basename(csr_path),
                       key=key_content, key_filename=os.path.basename(key_path))
    
    except Exception as e:
        print("Hiba történt", e)

@app.route('/download/<filename>')
def download_file(filename):
    return send_from_directory(app.config['GENERATED_FILES_FOLDER'], filename)

@app.route('/requestScheduleChange', methods=['POST'])
def request_schedule_change():
    data = request.get_json()
    print(f'ez van most ajmit nézek: {data}')
    username = current_user.username
    fullname = current_user.firstname + ' ' + current_user.lastname
    role_id = current_user.role
    user_id = current_user.id
    date = data['date']
    startHour = data['startHour']
    endHour = data['endHour']
    print(f'date: {date}, startHour: {startHour}, endHour: {endHour}')
    if role_id != 1:
        admins = query_db("SELECT id FROM users WHERE role_id = 1", (), one=False)
        admin_ids = [admin['id'] for admin in admins]
        admin_ids = json.dumps(admin_ids)
        try:
            schedule = query_db("SELECT * FROM beosztas WHERE userName = %s and currDate = %s", (username, date), one=True)
            execute_db("insert into beosztas_modositasa (userName, fullName, currDate, oldStartH, oldEndH, newStartH, newEndH) values (%s, %s, %s, %s, %s, %s, %s)", (username, fullname, date, schedule['startH'], schedule['endH'], startHour, endHour))

            id = query_db("SELECT id FROM beosztas_modositasa WHERE userName = %s and fullName = %s and currDate = %s and oldStartH = %s and oldEndH = %s and newStartH = %s and newEndH = %s", (username, fullname, date, schedule['startH'], schedule['endH'], startHour, endHour), one=True)
            print(id)
            id = id['id']
            message = f'{fullname} beosztást módosítást kért! Dátum: {date}, Kezdés: {startHour}, Vége: {endHour}'
            execute_db('insert into notifications ( notificationType, senderId, receivers, referenceId, message) values (%s, %s, %s, %s, %s)', ('beosztas_modositas', user_id, admin_ids, str(id), message))
        except mysql.connector.Error as err:
            print("Database error:", err)
            return jsonify({'status': 'error', 'message': str(err)}), 500
        return jsonify({'status': 'success'})

@app.route('/get_all_schedules', methods=['GET'])
def get_all_schedules():
    username = current_user.username
    try:
        rows = query_db("SELECT b.fullName, b.currDate, b.startH, b.endH, b.workSpot, u.color FROM beosztas as b JOIN users as u WHERE b.userName = u.userName", (), one=False)
        
        schedules = []
        for row in rows:
            startHour = (datetime.min + row['startH']).time().strftime('%H:%M')
            endHour = (datetime.min + row['endH']).time().strftime('%H:%M')
            schedules.append({
                'title': row['fullName'],
                'start': f"{row['currDate']}T{(startHour)}",
                'end': f"{row['currDate']}T{(endHour)}",
                'color': row['color'],
                'workSpot': str(row['workSpot']),
            })

        return jsonify(schedules)
    except Exception as e:
        print(f"Error fetching schedules from MySQL table: {e}")
        return jsonify([]), 500

@app.route('/freedom_calendar', methods=['GET'])
def freedom_calendar():
    try:
        rows = query_db("SELECT sz.fullName, sz.startDate, sz.endDate, sz.szabadsagType, u.color FROM szabadsag as sz JOIN users as u WHERE sz.userName = u.userName", (), one=False)
        
        holidays = []
        for row in rows: 
            startDate = datetime.strptime(str(row['startDate']), '%Y-%m-%d')
            endDate = datetime.strptime(str(row['endDate']), '%Y-%m-%d')
            datesList = get_dates_between(startDate, endDate)
            for currDate in datesList: 
                if is_holidayBence(currDate) != True and is_weekend(currDate) != True: 
                    holidays.append({
                        'title': row['fullName'],
                        'start': currDate,
                        'color': row['color'],
                        'szabadsagType': str(row['szabadsagType']),
                    })
                else:
                    continue

        return jsonify(holidays)
    except Exception as e:
        print(f"Error fetching schedules from MySQL table: {e}")
        return jsonify([]), 500

@app.route('/upload_sick_leave', methods=['GET', 'POST'])
def upload_sick_leave():
    approverUser = current_user.id
    data = request.json
    for key, value in data.items():
        keyword = key
        idlist = value
    try:
        dates = []
        for id in idlist:
            inserabledates = query_db('SELECT currDate from beosztas WHERE id = %s', (int(id),))
            usern = query_db('SELECT userName, fullName from beosztas WHERE id = %s', (int(id),))
            username = usern[0]['userName']
            fullname = usern[0]['fullName']
            dates.append(inserabledates[0]['currDate'])

        for id in idlist:
            execute_db('DELETE FROM beosztas WHERE id = %s', (int(id),))

        if keyword == "betegszabi":
            execute_db('INSERT INTO szabadsag (userName, fullName,  startDate, endDate, szabadsagType, approvedBy) VALUES (%s, %s, %s, %s, %s, %s)', (username, fullname, dates[0], dates[-1], "Betegszabi", approverUser))
        elif keyword == "simpleszabi":
            holidaysCount = int((datetime.strptime(str(dates[-1]), '%Y-%m-%d') - datetime.strptime(str(dates[0]), '%Y-%m-%d')).days)
            execute_db('INSERT INTO szabadsag (userName, fullName,  startDate, endDate, szabadsagType, approvedBy) VALUES (%s, %s, %s, %s, %s, %s)', (username, fullname, dates[0], dates[-1], "Szabadság", approverUser))
            execute_db("UPDATE users SET holidays = holidays - %s WHERE userName = %s", (holidaysCount, username))
        return jsonify({'result': idlist})
        
    except Error as e:
        print(f"Error reading data from MySQL table: {e}")
        return jsonify({}), 500



@app.route('/fullbeo')
@login_required
def fullbeo():
    return render_template('fullbeo.html')

@app.route('/holidays')
@login_required
def holidays():
    return render_template('szabistabla.html')

@app.route('/oktatas')
@login_required
@role_required(1,3)
def oktatas():
    return render_template('oktatas.html')

@app.route('/adminpage')
@login_required
def admin():
    return render_template('admin.html')


@app.route('/get_user_color', methods=['GET'])
def get_user_color():
    userName = current_user.username
    try:
        color = query_db("SELECT color FROM users WHERE userName = %s", (userName,), one=True)
        return jsonify(color)
    except Error as e:
        print(f"Error reading data from MySQL table: {e}")
        return jsonify({}), 500

# get_training
@app.route('/get_training', methods=['GET'])
def get_training():
    try:
        rows = query_db("SELECT o.fullName, o.eventName, o.currDate, o.startH, o.endH, u.color FROM oktatas as o join users as u where o.userName = u.userName", (), one=False)
        trainings_by_user = {}
        for row in rows:
            fullName = row['fullName']
            startHour = row['startH']
            startHour = (datetime.min + startHour).time().strftime('%H:%M')
            endHour = row['endH']
            endHour = (datetime.min + endHour).time().strftime('%H:%M')
            if fullName not in trainings_by_user:
                trainings_by_user[fullName] = []
            trainings_by_user[fullName].append({
                'date': row['currDate'].isoformat(),
                'startHour': str(startHour),
                'endHour': str(endHour),
                'eventName': row['eventName'],
                'color': row['color'],
            })

        return jsonify(trainings_by_user)
    except Error as e:
        print(f"Error reading data from MySQL table: {e}")
        return jsonify({}), 500

@app.route('/get_namelist', methods=['GET'])
def get_namelist():
    try:
        names = []
        users = query_db("SELECT userName, firstName, lastName FROM users", (), one=False)
        for item in users:
            username_dict = {item['userName']: item['firstName'] + ' ' + item['lastName']}
            names.append(username_dict)

        return jsonify(names)
    except Error as e:
        print(f"Error reading data from MySQL table: {e}")
        return jsonify({}), 500

# save_training
@app.route('/save_training', methods=['POST'])
def save_training():
    data = request.get_json()
    userName = current_user.username
    uname = data['username']
    eventname = data['eventname']
    trainings = data['training']
    for training in trainings:
        date = training['date']
        startHour = training['startHour']
        startHour = format_time(startHour)
        endHour = training['endHour']
        endHour = format_time(endHour)
        try:
            name = query_db("SELECT firstName, lastName FROM users WHERE userName = %s", (uname,), one=True)
            fullName = name['firstName'] + ' ' + name['lastName']
            execute_db("insert into oktatas (userName, fullName, eventName, currDate, startH, endH) values (%s, %s, %s, %s, %s, %s)", (uname, fullName, eventname, date, startHour, endHour))
        except mysql.connector.Error as err:
            print("Sikertelen csatlakozás! " + err)
            return "Sikertelen csatlakozás! " + err
    return jsonify({'status': 'success'})


@app.route('/delete_training', methods=['POST'])
def delete_training():
    deletableData = request.get_json()
    name = deletableData['name']
    date = deletableData['date']
    startHour = deletableData['startHour']
    try: 
        training_id = query_db("SELECT id FROM oktatas WHERE fullName = %s AND currDate = %s AND startH = %s", (name, date, startHour,), one=True)
        execute_db("DELETE FROM oktatas WHERE id = %s", (training_id['id'],))
    except mysql.connector.Error as err:
            print("Sikertelen csatlakozás! " + err)
            return "Sikertelen csatlakozás! " + err
    return jsonify({'status': 'success'})

#* postaláda oldal
@app.route("/notifications")
@login_required
def mailbox():
    return render_template("notifications.html")

@app.route('/get_notifications', methods=['GET'])
def get_notifications():
    user_role = current_user.role
    if user_role != 1:
        return jsonify({'error': 'Unauthorized'}), 403

    try:
        notifications = query_db("SELECT * FROM notifications WHERE status = 0")
        return jsonify(notifications)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/fetch_schedule_by_name', methods=['POST'])
def fetch_schedule_by_name():
    data = request.get_json() # Parse JSON data
    name = data.get('dropdown_name')
    month = data.get('dropdown_month')

    list_of_worker = query_db("SELECT id, userName, fullName, currDate, workSpot FROM beosztas WHERE userName = %s AND currDate BETWEEN %s AND %s ORDER BY currDate", (name, FALbyName(month)[0], FALbyName(month)[1]), one=False)

    listOfHoliday = query_db("SELECT id, userName, fullName, startDate, endDate, szabadsagType FROM szabadsag WHERE userName = %s AND startDate >= %s AND endDate <= %s ORDER BY startDate", (name, FALbyName(month)[0], FALbyName(month)[1]), one=False)

    holidays = []
    for hday in listOfHoliday:
        datesBetween = get_dates_between(hday['startDate'], hday['endDate'])
        for currDate in datesBetween:
            if is_holidayBence(currDate) != True and is_weekend(currDate) != True: 
                holidays.append({
                    'id': int(hday['id']),
                    'userName': str(hday['userName']),
                    'fullName': str(hday['fullName']),
                    'currDate': currDate,
                    'szabadsagType': str(hday['szabadsagType']),
                })

    #print(holidays)
    return jsonify(list_of_worker)

@app.route('/workhour_summary', methods=['POST'])
def workhour_summary():
    try: 
        summary = query_db("SELECT fullName, DATE_FORMAT(currDate, '%Y-%m') AS month, SUM(TIMESTAMPDIFF(HOUR, startH, endH)) AS total_hours FROM beosztas WHERE startH < '18:00:00' GROUP BY month, fullName ORDER BY month")
        
        overtime = query_db("SELECT fullName, DATE_FORMAT(currDate, '%Y-%m') AS month, SUM(TIMESTAMPDIFF(HOUR, startH, endH)) AS total_hours FROM beosztas WHERE startH >= '18:00:00' GROUP BY month, fullName ORDER BY month")

        holidaysSzabi = query_db("SELECT fullName, DATE_FORMAT(startDate, '%Y-%m') AS month, SUM((DATEDIFF(endDate, startDate) + 1) * 8) AS total_hours FROM szabadsag WHERE szabadsagType = 'Szabadság' GROUP BY fullName, month")

        holidaysBszabi = query_db("SELECT fullName, DATE_FORMAT(startDate, '%Y-%m') AS month, SUM((DATEDIFF(endDate, startDate) + 1) * 8) AS total_hours FROM szabadsag WHERE szabadsagType = 'Betegszabi' GROUP BY fullName, month")

        return jsonify({
            'data1': json.dumps(summary, cls=DecimalEncoder),
            'dict2': json.dumps(holidaysSzabi, cls=DecimalEncoder),
            'dict3': json.dumps(holidaysBszabi, cls=DecimalEncoder),
            'dict4': json.dumps(overtime, cls=DecimalEncoder)
        }), 200
    except Exception as e:
        traceback.print_exc()
        return jsonify({'error': str(e)}), 500

@app.route('/is_holiday', methods=['GET', 'POST'])
def is_holiday():
    data = request.get_json()
    date_str = data['date']
    
    try:
        # Dátum formátum ellenőrzése és konvertálása
        date_obj = datetime.strptime(date_str, '%Y-%m-%d')
        date_str = date_obj.strftime('%Y-%m-%d')
    except ValueError:
        return jsonify({"error": "Invalid date format"}), 400

    # Adatbázis lekérdezés
    isholiday = query_db("SELECT COUNT(*) FROM fixed_holidays WHERE holidayDate = %s", (date_str,))
    hddict = isholiday[0]
    value = int(hddict.get('COUNT(*)'))

    return jsonify({"is_holiday": value})



@app.route('/handle_batch_notification', methods=['POST'])
def handle_batch_notification():
    if current_user.role != 1:
        return jsonify({'error': 'Unauthorized'}), 403
    
    data = request.json
    notification_ids = data['notificationIds']
    is_approved = data['isApproved']
    approverUser = current_user.id

    for notification_id in notification_ids:
        noti_type_result = query_db("SELECT notificationType, referenceId FROM notifications WHERE id = %s", (notification_id,), one=True)
        if not noti_type_result:
            continue

        noti_type = noti_type_result['notificationType']
        reference_id = noti_type_result['referenceId']
        print(f'notification id: {notification_id}, reference id: {reference_id}')
        try:
            if is_approved:
                if noti_type == 'beosztas':
                    reference_indb = query_db("SELECT * from atmeneti_beosztas WHERE id = %s", (reference_id,), one=True)
                    if not reference_indb:
                        print(f'Nincs ilyen referencia id a db-ben')
                        continue
                    execute_db("UPDATE notifications SET status = 1 WHERE id = %s", (notification_id,))
                    execute_db("UPDATE atmeneti_beosztas SET isApproved = 1 WHERE id = %s", (reference_id,))
                    aprvd = query_db("SELECT userName, fullName, currDate, startH, endH, workSpot FROM atmeneti_beosztas WHERE id = %s", (reference_id,), one=True)
                    if aprvd:
                        execute_db("INSERT INTO beosztas (userName, fullName, currDate, startH, endH, workSpot, approvedBy) values (%s, %s, %s, %s, %s, %s, %s)", (aprvd['userName'], aprvd['fullName'], aprvd['currDate'], aprvd['startH'], aprvd['endH'], aprvd['workSpot'], approverUser))
                        execute_db("DELETE FROM atmeneti_beosztas WHERE id = %s", (reference_id,))

                elif noti_type == 'szabadsag':
                    reference_indb = query_db("SELECT * from atmeneti_szabadsag WHERE id = %s", (reference_id,), one=True)
                    if not reference_indb:
                        print(f'Nincs ilyen referencia id a db-ben')
                        continue
                    execute_db("UPDATE notifications SET status = 1 WHERE id = %s", (notification_id,))
                    execute_db("UPDATE atmeneti_szabadsag SET isApproved = 1 WHERE id = %s", (reference_id,))
                    aprvdHoliday = query_db("SELECT userName, fullName, startDate, endDate FROM atmeneti_szabadsag WHERE id = %s", (reference_id,), one=True)
                    ####-----------------
                    checkTempBeo = query_db("SELECT COUNT(*) FROM atmeneti_beosztas WHERE userName = %s AND currDate = %s", (aprvdHoliday['userName'], aprvdHoliday['startDate']))
                    hddictTB = checkTempBeo[0]
                    valueTB = int(hddictTB.get('COUNT(*)'))
                    checkBeo = query_db("SELECT COUNT(*) FROM beosztas WHERE userName = %s AND currDate = %s", (aprvdHoliday['userName'], aprvdHoliday['startDate']))
                    hddictB = checkBeo[0]
                    valueB = int(hddictB.get('COUNT(*)'))
                    ####-----------------

                    if aprvdHoliday:
                        list_of_dates = get_dates_between(aprvdHoliday['startDate'], aprvdHoliday['endDate'])
                        weekdays = cutOffWeekends(list_of_dates)
                        
                        for start, end in weekdays:
                            execute_db("INSERT INTO szabadsag (userName, fullName, startDate, endDate, szabadsagType, approvedBy) values (%s, %s, %s, %s, %s, %s)", (aprvdHoliday['userName'], aprvdHoliday['fullName'], start, end, "Szabadság", approverUser))
                            holidaysCount = int((datetime.strptime(str(aprvdHoliday['endDate']), '%Y-%m-%d') - datetime.strptime(str(aprvdHoliday['startDate']), '%Y-%m-%d')).days)
                            execute_db("UPDATE users SET holidays = holidays - %s WHERE userName = %s", (holidaysCount, aprvdHoliday['userName'],))

                        execute_db("DELETE FROM atmeneti_szabadsag WHERE id = %s", (reference_id,))
                    if valueTB == 0 and valueB == 0:
                        continue
                    elif valueTB == 1 and valueB == 0:
                        deleteFatmeneti(aprvdHoliday['startDate'], aprvdHoliday['endDate'], aprvdHoliday['userName'], "atmeneti")
                        print("megvangeco")
                    elif valueB == 1 and valueTB == 0:
                        deleteFatmeneti(aprvdHoliday['startDate'], aprvdHoliday['endDate'], aprvdHoliday['userName'], "beosztas")
                        print("megvangecobeo")
                    else: 
                        print("Kurva nagy baj van ha ezt látod")
                    
                elif noti_type == 'beosztas_modositas':
                    reference_indb = query_db("SELECT * FROM beosztas_modositasa WHERE id = %s", (reference_id,), one=True)
                    if not reference_indb:
                        print(f'Nincs ilyen referencia id a db-ben')
                        continue
                    execute_db("UPDATE notifications SET status = 1 WHERE id = %s", (notification_id,))
                    execute_db("UPDATE beosztas_modositasa SET isApproved = 1 WHERE id = %s", (reference_id,))
                    aprvdScheduleChange = query_db("SELECT userName, fullName, currDate, oldStartH, oldEndH, newStartH, newEndH FROM beosztas_modositasa WHERE id = %s", (reference_id,), one=True)
                    print(aprvdScheduleChange)
                    if aprvdScheduleChange:
                        execute_db("UPDATE beosztas SET startH = %s, endH = %s, approvedBy = %s WHERE userName = %s and currDate = %s", (aprvdScheduleChange['newStartH'], aprvdScheduleChange['newEndH'], approverUser, aprvdScheduleChange['userName'], aprvdScheduleChange['currDate']))
                        execute_db("DELETE FROM beosztas_modositasa WHERE id = %s", (reference_id,))
                execute_db("UPDATE notifications SET status = 1 WHERE id = %s", (notification_id,))
            else:
                if noti_type == 'beosztas':
                    scheduleId = query_db("SELECT referenceId FROM notifications WHERE id = %s", (notification_id,), one=True)
                    execute_db("DELETE FROM notifications WHERE id = %s", (notification_id,))
                    print(scheduleId)
                    execute_db("DELETE FROM atmeneti_beosztas WHERE id = %s", (scheduleId['referenceId'],))
                elif noti_type == 'szabadsag':
                    holidayId = query_db("SELECT referenceId FROM notifications WHERE id = %s", (notification_id,), one=True)
                    execute_db("DELETE FROM notifications WHERE id = %s", (notification_id,))
                    execute_db("DELETE FROM atmeneti_szabadsag WHERE id = %s", (holidayId['referenceId'],))
                elif noti_type == 'beosztas_modositas':
                    scheduleChangeId = query_db("SELECT referenceId FROM notifications WHERE id = %s", (notification_id,), one=True)
                    execute_db("DELETE FROM notifications WHERE id = %s", (notification_id,))
                    execute_db("DELETE FROM beosztas_modositasa WHERE id = %s", (scheduleChangeId['referenceId'],))
        except Exception as e:
            print(f"Error processing notification {notification_id}: {e}")
    return jsonify({'status': 'success'}), 200

@app.route('/get_username_by_id/<int:user_id>')
def get_username_by_id(user_id):
    try:
        user = query_db("SELECT firstName, lastName FROM users WHERE id = %s", (user_id,), one=True)
        fullName = f"{user['firstName']} {user['lastName']}"
        if fullName:
            return jsonify({'id': user_id, 'name': fullName})
        else:
            return jsonify({'error': 'User not found'}), 404
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/xml', methods=['GET','POST'])
def index():
    return render_template('xml.html')

# Route to handle AJAX requests for analyzer interaction
@app.route('/analyze', methods=['POST'])
def analyze():
    try:
        data = request.json
        response = data.get('response')
        current_question = data.get('question')
        xml_data = data.get('file')

        # Process user response based on current question
        if current_question == "":
            if response == '3':
                message, next_question = xmltool.mainprog(xml_data, response)

            elif response == '4':
                message, next_question = xmltool.mainprog(xml_data, response)

            elif response == '5':
                message, next_question = xmltool.mainprog(xml_data, response)

            elif response == '1':
                fixresp = '1'
                message = "Enter the data type you want to analyze."

            elif response == '2':
                fixresp = '2'
                message = "Enter the data type you want to analyze."

            elif response == '6':
                fixresp = '6'
                message = "Enter the data type you want to analyze."

            elif response == 'q':
                message, next_question = xmltool.mainprog(xml_data, response)
            
            else:
                message = xmltool.mainprog(xml_data, response)

        elif current_question == "data_type":
            message, next_question = xmltool.mainprog(xml_data, response)
        
        return jsonify({"message": message, "question": next_question})
    except Exception as e:
        print(f"There was an error occured: {e}")

#* e-mail küldés
def send(to_email) -> None:
    subject = 'Elfelejtett jelszó'
    body = f"""Az új jelszavad: Almafa12"""
    message = EmailMessage()
    message['Subject'] = subject
    message['From'] = from_email
    message['To'] = to_email
    message.set_content(body)
    context = ssl.create_default_context()
    with smtplib.SMTP_SSL('smtp.gmail.com', 465, context=context) as server:
        server.login(from_email, password)
        server.send_message(message)

  

def send2(to_emial, fullName, type) -> None:
    fullname = fullName

    if type == 'beosztas':
        date = ''
        startHour = ''
        endHour = ''
        subject = 'Új beosztás feltöltés érkezett.'
        body = f"""Az új beosztás: {fullname}: {date} {startHour}-{endHour}."""
    elif type == 'szabadsag':
        startDate = ''
        endDate = ''
        subject = 'Új szabadság kérelem érkezett.'
        body = f"""Az új szabadság kérelem: {fullname}: {startDate} - {endDate}."""
    message  = EmailMessage()
    message['Subject'] = subject
    message['From'] = from_email
    message['To'] = to_emial
    message.set_content(body)
    context = ssl.create_default_context()
    with smtplib.SMTP_SSL('smtp.gmail.com', 465, context=context) as server:
        server.login(from_email, password)
        server.send_message(message)
    


if __name__ == '__main__':
    socketio.run(app, host="0.0.0.0", debug=True)


