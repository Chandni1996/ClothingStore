package ClothingStore.SignUp;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity


public class SignUpCat {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	
	    int s_Id;
		@NotEmpty(message="Username cannot be empty") @Size(min=5,max=25, message="Sign Up Name must be between 4 and 20 charecters")
		private String usr;
		@NotEmpty(message="Email cannot be empty")
		private String email;
		@NotEmpty(message="Password cannot be empty")
		private String pwd;
		@NotEmpty(message="Password Mismatch")
		private String con_pwd;
		@NotEmpty(message="Mobile No. cannot be empty") @Pattern(regexp="[7-9][0-9]{9,9}", message ="Mobile number must have a valid Indian Format")
		private String mb_no;
		@NotEmpty(message="Address cannot be empty")
		private String adr;

		

	private String role="USER";
	private boolean active=true;
	
	public int getS_Id() {
		return s_Id;
	}

	public void setS_Id(int s_Id) {
		this.s_Id = s_Id;
	}


	public SignUpCat() {
		
	}

	public String getUsr() {
		return usr;
	}

	public void setUsr(String usr) {
		this.usr = usr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getCon_pwd() {
		return con_pwd;
	}

	public void setCon_pwd(String con_pwd) {
		this.con_pwd = con_pwd;
	}

	public String getMb_no() {
		return mb_no;
	}

	public void setMb_no(String mb_no) {
		this.mb_no = mb_no;
	}
	
	public String getAdr() {
		return adr;
	}

	public void setAdr(String adr) {
		this.adr = adr;
	}


	}
