package com.hari.StudentManagementSystem_Backend.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "studentdatamgmt")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Student {

    @Id
    private String id;
    private String firstname;
    private String surname;
    private Integer age;
    private String date_of_birth;
    private String gender;
    private String contact_no;
    private Integer year_of_join;
    private String department;
    private String student_class;
    private String father_name;
    private String mother_name;
    private Double sem1;
    private Double sem2;
    private Double sem3;
    private Double sem4;
    private Double sem5;
    private Double sem6;
    private Double sem7;
    private Double sem8;
    private Integer tot_arr;
}
