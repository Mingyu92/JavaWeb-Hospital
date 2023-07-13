package hospital.service;

import hospital.dao.impl.AdminDaoImpl;
import hospital.user.Admin;

import java.util.List;
import java.util.Objects;

public class AdminService {
    AdminDaoImpl adminDao=new AdminDaoImpl();

    public boolean AdminLogin(String A_Name,String A_password){
        Admin admin=adminDao.find(A_Name);
        if(admin==null){
            System.out.println("NO");
            return false;
        }
        if(!Objects.equals(admin.getA_password(), A_password)){
            return false;
        }
        return true;
    }

    public Admin AdminRegister(String A_Name,String A_password,String A_phone,String create_time){
        Admin admin=new Admin();
        admin.setA_Name(A_Name);
        admin.setA_password(A_password);
        admin.setA_phone(A_phone);
        admin.setCreate_time(create_time);
        return adminDao.add(admin);
    }

    public Admin AdminShow(int adminID){
        return adminDao.findID(adminID);
    }

    public boolean AdminUpdate(int adminID,String A_Name,String A_password,String A_phone,String create_time){
        Admin admin=adminDao.findID(adminID);
        if(admin==null){
            return false;
        }
        admin.setA_Name(A_Name);
        admin.setA_password(A_password);
        admin.setA_phone(A_phone);
        admin.setCreate_time(create_time);
        return adminDao.update(admin);
    }

    public List<Hospital> AllHospital(){
        try {
            Connection connection = DbConnection.getConnection();
            String sql = "select * from hospital ";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            List<Hospital> hospitalList = new ArrayList<>();
            while (rs.next()) {
                Hospital hospital = new Hospital();
                hospital.setId(rs.getInt("HospitalID"));
                hospital.setName(rs.getString("HospitalName"));
                hospital.setLevel(rs.getString("HospitalLevel"));
                hospital.setAddress(rs.getString("HospitalAddress"));
                hospital.setNumber(rs.getString("ContactNumber"));
                hospital.setPresidentname(rs.getString("PresidentName"));
                hospital.setTime(rs.getString("EstablishmentDate"));
                hospital.setStatus(rs.getString("OperationStatus"));
                hospital.setIntroduction(rs.getString("Introduction"));

                hospitalList.add(hospital);
            }
            return hospitalList;
        } catch (Exception var7) {
            var7.printStackTrace();
            return null;
        }
    }

    public List<Department> AllDepartment(){
        try {
            Connection connection = DbConnection.getConnection();
            String sql = "select * from department ";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            List<Department> departmentList = new ArrayList<>();
            while (rs.next()) {
                Department department=new Department();
                department.setDepartmentid(rs.getInt("departmentid"));
                department.setDepartmentname(rs.getString("departmentname"));
                departmentList.add(department);
            }
            return departmentList;
        } catch (Exception var7) {
            var7.printStackTrace();
            return null;
        }
    }
}
