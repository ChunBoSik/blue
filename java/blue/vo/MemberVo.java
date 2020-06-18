package com.spring.blue.vo;

public class MemberVo {
  private int idx;
  private String mid, pwd, name, nickname, gender, tel, hobby, email, joinday, userinfor;
  private int level;
  private String userdel, content;
  
  private String strlevel;  // 레벨을 문자로 변환받는 변수(예: 0은 관리자, 1:특별회원, 2:우수회원, 3:정회원, 4:준회원)
  
  public MemberVo() {}

  public int getIdx() {
    return idx;
  }

  public void setIdx(int idx) {
    this.idx = idx;
  }

  public String getMid() {
    return mid;
  }

  public void setMid(String mid) {
    this.mid = mid;
  }

  public String getPwd() {
    return pwd;
  }

  public void setPwd(String pwd) {
    this.pwd = pwd;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public String getHobby() {
    return hobby;
  }

  public void setHobby(String hobby) {
    this.hobby = hobby;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getJoinday() {
    return joinday;
  }

  public void setJoinday(String joinday) {
    this.joinday = joinday;
  }

  public String getUserinfor() {
    return userinfor;
  }

  public void setUserinfor(String userinfor) {
    this.userinfor = userinfor;
  }

  public int getLevel() {
    return level;
  }

  public void setLevel(int level) {
    this.level = level;
  }

  public String getUserdel() {
    return userdel;
  }

  public void setUserdel(String userdel) {
    this.userdel = userdel;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getStrlevel() {
    return strlevel;
  }

  public void setStrlevel(String strlevel) {
    this.strlevel = strlevel;
  }

  @Override
  public String toString() {
    return "MemberVo [idx=" + idx + ", mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", nickname=" + nickname
        + ", gender=" + gender + ", tel=" + tel + ", hobby=" + hobby + ", email=" + email + ", joinday=" + joinday
        + ", userinfor=" + userinfor + ", level=" + level + ", userdel=" + userdel + ", content=" + content
        + ", strlevel=" + strlevel + "]";
  }
}
