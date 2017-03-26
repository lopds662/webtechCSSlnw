<?php

class DB_Controller{
    private $username = "";
    private $password = "";
    private $hostname = "";
    private $dbname = "";   
    private $connection;
    
    public function __construct(){
        include("dbconfig.php");
        $this->username = $uname;
        $this->password = $pass;
        $this->hostname = $host;
        $this->dbname = $db;
        try{
            $this->connection = new PDO("mysql:host={$this->hostname};"."dbname={$this->dbname}",$this->username,$this->password);         
        } catch (PDOException $e){
            die("Couldn't connect to the database ".$this->dbname.": ".$e->getMessage());
        }
    }

    public function getLogin($uname, $pass){
        try{
            $sql = 'SELECT user.username, user.password, user.fname, user.lname, role.role_name, user.role_id FROM user, role WHERE user.username = "'.$uname.'" and user.role_id = role.id';
            $q = $this->connection->prepare($sql);
            $q->execute();

            $row = $q->fetch();
            if ($row['password'] == $pass){
                $userin = array();
                $userin["username"] = $row['username'];
                $userin['firstname'] = $row['fname'];
                $userin['lastname'] = $row['lname'];
                $userin['role'] = $row['role_id'];
                echo json_encode($userin);
            }else {
                echo "Username/Password not found.";
            }

        } catch (PDOException $e){
            die("Couldn't Login to the database ".$this->dbname.": ".$e->getMessage());
        }
    }

    public function getAllUser(){
        try{
            $sql = 'SELECT user.username, user.fname, user.lname, role.role_name FROM user, role WHERE user.role_id = role.id';
            // $sql = "SELECT * FROM user";
            $q = $this->connection->prepare($sql);
            $q->execute();

            $tempArr = array();
            $n =0;
            while ($row = $q->fetch()) {
                $temp = array();
                $temp['username'] = $row['username'];
                $temp['firstname'] = $row['fname'];
                $temp['lastname'] = $row['lname'];
                $temp['role'] = $row['role_name'];
                $tempArr[$n] = $temp;
                $n++;
            }
            echo json_encode($tempArr);

        } catch (PDOException $e){
            die("Couldn't getAllUser from the database ".$this->dbname.": ".$e->getMessage());
        }
    }

    public function addUser($username, $pass, $firstname, $lastname, $role){
        try{
            $sql = 'INSERT INTO project_webtech_csslnw.user (username, password, fname, lname, pic_path, role_id) VALUES ($username, $pass, $firstname, $lastname, "", $role)';
            $q = $this->connection->prepare($sql);
            $q->execute();
            echo "Database Inserte successful.";
        } catch (PDOException $e){
            die("Couldn't addUser to the database ".$this->dbname.": ".$e->getMessage());
        }
    }
    public function getAllSubjectBySemester($semester, $year){
        try{
            // $sql = 'SELECT * FROM `subject_semester` WHERE year = ".$year." and semester = ".$semester.';
            $sql = 'SELECT DISTINCT subject_semester.id_subject as SubjectID, subject.name, subject.credit, subject_teacher.username as TeacherID, user.fname, user.lname '.
                    'FROM subject_semester, subject, subject_teacher, user '.
                    'WHERE subject_semester.year = "'.$year.'" and subject_semester.semester = "'.$semester.'" and subject_semester.id_subject = subject.id and subject_teacher.username = user.username';
            $q = $this->connection->prepare($sql);
            $q->execute();
            
            $tempArr = array();
            $n =0;
            // echo $q->rowCount()." ASA";
            while ($row = $q->fetch()) {
                $temp = array();
                $temp['subjectID'] = $row['SubjectID'];
                $temp['name'] = $row['name'];
                $temp['credit'] = $row['credit'];
                $temp['teacherID'] = $row['TeacherID'];
                $temp['firstname'] = $row['fname'];
                $temp['lastname'] = $row['lname'];
                $tempArr[$n] = $temp;
                $n++;
            }
            echo json_encode($tempArr);
        } catch (PDOException $e){
            die("Couldn't getAllSubjectBySemester from the database ".$this->dbname.": ".$e->getMessage());
        }
    }
    
}
?>