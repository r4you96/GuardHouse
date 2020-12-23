import pymysql
import json

# warning : every query has their own "commit" 

class database_class:
    #클래스 생성자, 사용할 변수들을 적어주세요
    def __init__(self):
        self.conn = None
        self.curs = None
        self.database_init()
    #database를 시작하는 메소드
    def database_init(self):
        print("connecting database...")
        self.conn = pymysql.connect(host='localhost', user='root', password='dmlrhd', db='guardhouse',charset='euckr')
        self.curs = self.conn.cursor()
        print("done")
     # 새로운 원아 추가
    def add_car(self, car_name, car_number):
        sql = "INSERT INTO car(car_name, car_number) VALUES ('아하', '우측쓰리런');"  # 실행 할 쿼리문 입력
        self.curs.execute(sql)  # 쿼리문 실행
        self.conn.commit()

    def add_new(self, class_id, name, phone):
        print("db끝났슴?" + str(class_id) + name + phone)
        sql = "INSERT INTO child (class_id, child_name, parent_phone) VALUE (" + str(
            class_id) + ", '" + name + "', '" + phone + "');"  # 실행 할 쿼리문 입력
        self.curs.execute(sql)  # 쿼리문 실행

        sql = "SELECT child_id FROM child WHERE child_name = '" + name + "' AND parent_phone = '" + phone + "';"
        self.curs.execute(sql)  # 쿼리문 실행
        rows = self.curs.fetchall()  # 데이터 패치

        for i in rows:
            child_id = i[0]

        self.conn.commit()

        return child_id

    def account_exist(self, id):
        sql = "SELECT teacher_name FROM teacher WHERE account_id = '" + id + "';"
        self.curs.execute(sql)
        rows = self.curs.fetchall()

        if len(rows) > 0:
            raise Exception('account already exist : ' + rows[0][0])

    # 원아 정보 수정
    def set_child_info(self, pk, class_id, name, phone):
        sql = "UPDATE child SET class_id = " + str(
            class_id) + ", child_name = '" + name + "', parent_phone = '" + phone + "' WHERE child_id = " + str(
            pk) + ";"  # 실행 할 쿼리문 입력
        self.curs.execute(sql)  # 쿼리문 실행
        self.conn.commit()
        
    #원아 보호자 핸드폰 번호 가져오기
    def get_parent_phone(self, pk):
        sql = "SELECT parent_phone FROM child WHERE child_id = " + str(pk) + ";"
        self.curs.execute(sql)  # 쿼리문 실행
        rows = self.curs.fetchall()  # 데이터 패치

        for i in rows:
            parent_phone = i[0]

        return parent_phone

    # select 로 데이터를 받아올 메소드
    def select_query(self, str):
        sql = str  # 실행 할 쿼리문 입력
        self.curs.execute(sql)  # 쿼리문 실행
        rows = self.curs.fetchall()  # 데이터 패치

        return rows
    # update, delete 등등의 명령을 입력할 메소드
    def excute_query(self,str):
        sql = str  # 실행 할 쿼리문 입력
        self.curs.execute(sql)  # 쿼리문 실행
        self.conn.commit()

    def clear(self):
        print("clear db connection...")
        self.conn.close()
        print("done")
    #end of funtion
#end of class

if __name__ == "__main__":
    sd = database_class()
    querys ="select * from rank;"
    row = sd.select_query(querys)
    print(row)
    sd.conn.close()

