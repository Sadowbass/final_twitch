package bean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.http.HttpRequest;

import com.fasterxml.jackson.databind.deser.std.DateDeserializers.CalendarDeserializer;

import mybatis.Factory;

import java.io.File;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HEDao {

    SqlSession sqlSession;

    public HEDao() {
        this.sqlSession = Factory.getFactory().openSession();
    }

    public List<MemberVo> member_select() {
        List<MemberVo> list = null;
        try {
            list = sqlSession.selectList("member.select");
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public MemberVo member_view(String mid) {
        MemberVo vo = null;
        try {
            vo = sqlSession.selectOne("member.view", mid);

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return vo;
        }

    }

    public String member_insert(MemberVo vo, HttpServletRequest req) {
        String msg = "dao 시작";
        try {
            int cnt = sqlSession.insert("member.insert", vo);
            if (cnt < 1) {
                throw new Exception("본문 저장중 오류 발생");
            }
            if (vo.getPh_sysfile() != null) {
                cnt = sqlSession.insert("member.insert_p", vo);
                if (cnt < 1) {
                    throw new Exception("사진 저장중 오류 발생");
                }
            }
            msg = "입력 성공";
            sqlSession.commit();

        } catch (Exception ex) {
            ex.printStackTrace();
            msg = ex.getMessage();
            sqlSession.rollback();
            delFile(vo, req);

        } finally {
            return msg;
        }

    }

    public String member_modify(MemberVo vo, HttpServletRequest req) {
        String msg = "dao 시작";
        try {
            //본문 글 수정
            int cnt = sqlSession.update("member.update", vo);
            if (cnt < 1) {
                throw new Exception("본문 글 수정 중 오류 발생");
            }

            if (vo.getPh_sysfile() != null) {
                MemberVo delvo = sqlSession.selectOne("member.ph_sysfile", vo);
                if (delvo != null) {
                    //기존 사진이 있는 경우(수정)
                    int cnt2 = sqlSession.update("member.ph_modify", vo);
                    if (cnt2 < 1) throw new Exception("첨부사진 수정 중 오류 발생");
                    //기존 사진 삭제
                    delFile(delvo, req);

                } else {
                    //기존파일 없었는데 추가
                    cnt = sqlSession.insert("member.ph_insert", vo);
                    if (cnt < 1) throw new Exception("첨부사진 추가 중 오류 발생");

                }
            }

            sqlSession.commit();

        } catch (Exception ex) {
            msg = ex.getMessage();
            ex.printStackTrace();
            delFile(vo, req);
            sqlSession.rollback();
        } finally {
            return msg;
        }

    }

    public void delFile(MemberVo vo, HttpServletRequest req) {
        String path = req.getSession().getServletContext().getRealPath("/img/user-photo/");//상대경로 -> 가상서버의 사진만 삭제
        File f = new File(path + vo.getPh_sysfile());
        if (f.exists()) f.delete();
    }

    public void delFile2(BroadCastingCateVo vo, HttpServletRequest req) {
        String path = req.getSession().getServletContext().getRealPath("/img/cate/");//상대경로 -> 가상서버의 사진만 삭제
        File f = new File(path + vo.getCat_sysfile());
        if (f.exists()) f.delete();

    }

    public String member_delete(String mid, HttpServletRequest req) {
        String msg = "dao 시작";
        MemberVo delvo = new MemberVo();
        try {
            int cnt = sqlSession.delete("member.delete", mid);
            if (cnt < 1) throw new Exception("삭제 중 오류 발생");
            delvo.setPh_id(mid);
            delvo = sqlSession.selectOne("member.ph_sysfile", delvo);
            if (delvo != null) {
                delFile(delvo, req);//파일 삭제
                cnt = sqlSession.delete("member.ph_delete", mid);
                if (cnt < 1) throw new Exception("첨부 사진 테이블 삭제 중 오류 ");
            }

            sqlSession.commit();
            msg = "삭제 성공";

        } catch (Exception ex) {
            sqlSession.rollback();
            msg = ex.getMessage();
            ex.printStackTrace();

        } finally {
            return msg;
        }
    }

    public List<BroadCastingCateVo> cate_select() {
        List<BroadCastingCateVo> list = null;
        try {
            list = sqlSession.selectList("cate.select");
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public BroadCastingCateVo cate_view(String serial) {
        BroadCastingCateVo vo = null;
        try {
            vo = sqlSession.selectOne("cate.view", serial);

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return vo;
        }

    }

    public String cate_delete(String serial, HttpServletRequest req) {
        String msg = "dao 시작";
        BroadCastingCateVo vo = new BroadCastingCateVo();
        try {
            vo = sqlSession.selectOne("cate.view", serial);
            int cnt = sqlSession.delete("cate.delete", serial);
            if (cnt < 1) throw new Exception("삭제 중 오류 발생");
            if (vo.getCat_sysfile() != null) {
                delFile2(vo, req);//파일 삭제
            }
            sqlSession.commit();
            msg = "삭제 성공";

        } catch (Exception ex) {
            sqlSession.rollback();
            msg = ex.getMessage();
            ex.printStackTrace();

        } finally {
            return msg;
        }
    }

    public String cate_modify(BroadCastingCateVo vo, HttpServletRequest req) {
        String msg = "dao 시작";
        try {
            //본문 글 수정
            int cnt = sqlSession.update("cate.update", vo);
            if (cnt < 1) {
                throw new Exception("본문 글 수정 중 오류 발생");
            }

            if (vo.getCat_sysfile() != null) {
                BroadCastingCateVo delvo = sqlSession.selectOne("cate.ph_sysfile", vo);
                if (delvo.getCat_sysfile() != null) {
                    //기존 사진이 있는 경우(수정)
                    int cnt2 = sqlSession.update("cate.ph_modify", vo);
                    if (cnt2 < 1) throw new Exception("첨부사진 수정 중 오류 발생");
                    //기존 사진 삭제
                    delFile2(delvo, req);

                } else {
                    //기존파일 없었는데 추가
                    cnt = sqlSession.update("cate.ph_modify", vo);
                    if (cnt < 1) throw new Exception("첨부사진 추가 중 오류 발생");

                }
            }

            sqlSession.commit();

        } catch (Exception ex) {
            msg = ex.getMessage();
            ex.printStackTrace();
            delFile2(vo, req);
            sqlSession.rollback();
        } finally {
            return msg;
        }

    }

    public String cate_insert(BroadCastingCateVo vo, HttpServletRequest req) {
        String msg = "dao 시작";
        try {
            int cnt = sqlSession.insert("cate.insert", vo);
            if (cnt < 1) {
                throw new Exception("본문 저장중 오류 발생");
            }
            msg = "입력 성공";
            sqlSession.commit();

        } catch (Exception ex) {
            ex.printStackTrace();
            msg = ex.getMessage();
            sqlSession.rollback();
            delFile2(vo, req);

        } finally {
            return msg;
        }

    }

    public List<TagVo> tag_select() {
        List<TagVo> list = null;
        try {
            list = sqlSession.selectList("cate.tag_select");
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<TagVo> tag_search(String findStr) {
        List<TagVo> list = null;
        try {
            list = sqlSession.selectList("cate.tag_search", findStr);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public String tag_delete(String serial) {
        String msg = "dao 시작";
        try {
            int cnt = sqlSession.delete("cate.tag_delete", serial);
            if (cnt < 1) throw new Exception("삭제 중 오류 발생");
            sqlSession.commit();
            msg = "삭제 성공";
        } catch (Exception ex) {
            sqlSession.rollback();
            msg = ex.getMessage();
            ex.printStackTrace();
        } finally {
            return msg;
        }
    }

    public String tag_insert(String tn) {
        String msg = "dao 시작";
        try {
            int cnt = sqlSession.insert("cate.tag_insert", tn);
            if (cnt < 1) {
                throw new Exception("본문 저장중 오류 발생");
            }
            msg = "입력 성공";
            sqlSession.commit();

        } catch (Exception ex) {
            ex.printStackTrace();
            msg = ex.getMessage();
            sqlSession.rollback();

        } finally {
            return msg;
        }

    }

    public List<StreamerVo> streamer_select() {
        List<StreamerVo> list = null;
        try {
            list = sqlSession.selectList("stream.select");
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public StreamerVo streamer_view(String mid) {
        StreamerVo vo = null;
        try {
            vo = sqlSession.selectOne("stream.view", mid);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return vo;
        }

    }

    public List<List<String>> weekly_broad_time(String mid) {
        List<List<String>> list = new ArrayList<List<String>>();
        try {
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = GregorianCalendar.getInstance();
            cal.setTime(new Date());


            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);
            for (int i = 1; i < 8; i++) {
                cal.set(Calendar.DAY_OF_WEEK, i);
                String day = format.format(cal.getTime());
                map.put("day", day);
                List<String> broad_time = new ArrayList<String>();
                broad_time = sqlSession.selectList("stream.weekly_broad_time", map);
                list.add(broad_time);
            }


        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }

    }

    public List<List<String>> monthly_broad_time(String mid) {
        List<List<String>> list = new ArrayList<List<String>>();
        try {
            int year = 2020;
	        /*int day = 1;
	        DecimalFormat df = new DecimalFormat("00");
	        Calendar currentCalendar = Calendar.getInstance();*/

            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);
            map.put("year", year);
	        
	        /*String month  = df.format(currentCalendar.get(Calendar.MONTH) + 1);이번달 구하기
	        int m = Integer.parseInt(month);*/

            for (int i = 1; i < 13; i++) {
	        	
	        	/*SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        	
	        	Calendar cal = Calendar.getInstance();
	        	
	        	cal.set(year, i-1, day); //월은 -1해줘야 해당월로 인식
	        	
	        	String firstday = dateFormat.format(cal.getTime());
	        	
	        	cal.set(year,i-1,cal.getActualMaximum(Calendar.DAY_OF_MONTH));
	        	
	        	String lastday =  dateFormat.format(cal.getTime());
	        	
	        	map.put("sday", firstday);
	        	map.put("lday", lastday);*/
                map.put("month", i);

                List<String> broad_time = sqlSession.selectList("stream.monthly_broad_time", map);
                list.add(broad_time);

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }

    }

    public List<List<String>> year_broad_time(String mid) {
        List<List<String>> list = new ArrayList<List<String>>();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);

            DecimalFormat df = new DecimalFormat("00");
            Calendar currentCalendar = Calendar.getInstance();
            String year = df.format(currentCalendar.get(Calendar.YEAR) + 1);
            int y = Integer.parseInt(year);

            for (int i = y - 10; i < y + 1; i++) {
                map.put("year", i);
                List<String> broad_time = sqlSession.selectList("stream.year_broad_time", map);
                list.add(broad_time);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> weekly_follow(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);

            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = GregorianCalendar.getInstance();
            cal.setTime(new Date());

            for (int i = 1; i < 8; i++) {
                cal.set(Calendar.DAY_OF_WEEK, i);
                String day = format.format(cal.getTime());
                map.put("day", day);
                String cnt = sqlSession.selectOne("stream.weekly_follow", map);
                list.add(cnt);
            }


        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> weekly_follow_tot(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);

            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = GregorianCalendar.getInstance();
            cal.setTime(new Date());

            for (int i = 1; i < 8; i++) {
                cal.set(Calendar.DAY_OF_WEEK, i);
                cal.add(Calendar.DATE, 1);//날짜+1
                String day = format.format(cal.getTime());
                map.put("day", day);
                String cnt = sqlSession.selectOne("stream.weekly_follow_tot", map);
                list.add(cnt);
            }


        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> weekly_sub(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);

            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = GregorianCalendar.getInstance();
            cal.setTime(new Date());

            for (int i = 1; i < 8; i++) {
                cal.set(Calendar.DAY_OF_WEEK, i);
                String day = format.format(cal.getTime());
                map.put("day", day);
                String cnt = sqlSession.selectOne("stream.weekly_sub", map);
                list.add(cnt);
            }


        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> weekly_sub_tot(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);

            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = GregorianCalendar.getInstance();
            cal.setTime(new Date());
            for (int i = 1; i < 8; i++) {
                cal.set(Calendar.DAY_OF_WEEK, i);
                cal.add(Calendar.DATE, 1);//날짜+1
                String day = format.format(cal.getTime());
                map.put("day", day);
                String cnt = sqlSession.selectOne("stream.weekly_sub_tot", map);
                list.add(cnt);
            }


        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> monthly_sub(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            int year = 2020;
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);
            map.put("year", year);
            for (int i = 1; i < 13; i++) {
                map.put("month", i);
                String cnt = sqlSession.selectOne("stream.monthly_sub", map);
                list.add(cnt);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> monthly_sub_tot(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            int year = 2020;
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);
            map.put("year", year);
            for (int i = 2; i < 14; i++) {
                map.put("month", i);
                String cnt = sqlSession.selectOne("stream.monthly_sub_tot", map);
                list.add(cnt);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> monthly_follow(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            int year = 2020;
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);
            map.put("year", year);

            for (int i = 1; i < 13; i++) {
                map.put("month", i);
                String cnt = sqlSession.selectOne("stream.monthly_follow", map);
                list.add(cnt);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> monthly_follow_tot(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            int year = 2020;
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);
            map.put("year", year);

            for (int i = 2; i < 14; i++) {
                map.put("month", i);
                String cnt = sqlSession.selectOne("stream.monthly_follow_tot", map);
                list.add(cnt);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> year_sub(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);

            DecimalFormat df = new DecimalFormat("00");
            Calendar currentCalendar = Calendar.getInstance();
            String year = df.format(currentCalendar.get(Calendar.YEAR) + 1);
            int y = Integer.parseInt(year);

            for (int i = y - 10; i < y + 1; i++) {
                map.put("year", i);
                String cnt = sqlSession.selectOne("stream.year_sub", map);
                list.add(cnt);
            }


        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> year_follow(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);

            DecimalFormat df = new DecimalFormat("00");
            Calendar currentCalendar = Calendar.getInstance();
            String year = df.format(currentCalendar.get(Calendar.YEAR) + 1);
            int y = Integer.parseInt(year);

            for (int i = y - 10; i < y + 1; i++) {
                map.put("year", i);
                String cnt = sqlSession.selectOne("stream.year_follow", map);
                list.add(cnt);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> year_sub_tot(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);

            DecimalFormat df = new DecimalFormat("00");
            Calendar currentCalendar = Calendar.getInstance();
            String year = df.format(currentCalendar.get(Calendar.YEAR) + 1);
            int y = Integer.parseInt(year);

            for (int i = y - 9; i < y + 2; i++) {
                map.put("year", i);
                String cnt = sqlSession.selectOne("stream.year_sub_tot", map);
                list.add(cnt);
            }


        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> year_follow_tot(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);

            DecimalFormat df = new DecimalFormat("00");
            Calendar currentCalendar = Calendar.getInstance();
            String year = df.format(currentCalendar.get(Calendar.YEAR) + 1);
            int y = Integer.parseInt(year);

            for (int i = y - 9; i < y + 2; i++) {
                map.put("year", i);
                String cnt = sqlSession.selectOne("stream.year_follow_tot", map);
                list.add(cnt);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> weekly_don(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);

            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = GregorianCalendar.getInstance();
            cal.setTime(new Date());

            for (int i = 1; i < 8; i++) {
                cal.set(Calendar.DAY_OF_WEEK, i);
                String day = format.format(cal.getTime());
                map.put("day", day);
                String cnt = sqlSession.selectOne("stream.weekly_don", map);
                if (cnt == null) {
                    cnt = "0";
                }
                list.add(cnt);

            }


        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> weekly_subpofit(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);

            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = GregorianCalendar.getInstance();
            cal.setTime(new Date());

            for (int i = 1; i < 8; i++) {
                cal.set(Calendar.DAY_OF_WEEK, i);
                String day = format.format(cal.getTime());
                map.put("day", day);
                String cnt = sqlSession.selectOne("stream.weekly_subprofit", map);
                list.add(cnt);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> monthly_don(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            int year = 2020;
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);
            map.put("year", year);

            for (int i = 1; i < 13; i++) {
                map.put("month", i);
                String cnt = sqlSession.selectOne("stream.monthly_don", map);
                if (cnt == null) {
                    cnt = "0";
                }
                list.add(cnt);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> monthly_subprofit(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            int year = 2020;
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);
            map.put("year", year);

            for (int i = 1; i < 13; i++) {
                map.put("month", i);
                String cnt = sqlSession.selectOne("stream.monthly_subprofit", map);
                list.add(cnt);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> year_don(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);

            DecimalFormat df = new DecimalFormat("00");
            Calendar currentCalendar = Calendar.getInstance();
            String year = df.format(currentCalendar.get(Calendar.YEAR) + 1);
            int y = Integer.parseInt(year);

            for (int i = y - 10; i < y + 1; i++) {
                map.put("year", i);
                String cnt = sqlSession.selectOne("stream.year_don", map);
                if (cnt == null) {
                    cnt = "0";
                }
                list.add(cnt);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> year_subprofit(String mid) {
        List<String> list = new ArrayList<String>();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);

            DecimalFormat df = new DecimalFormat("00");
            Calendar currentCalendar = Calendar.getInstance();
            String year = df.format(currentCalendar.get(Calendar.YEAR) + 1);
            int y = Integer.parseInt(year);

            for (int i = y - 10; i < y + 1; i++) {
                map.put("year", i);
                String cnt = sqlSession.selectOne("stream.year_subprofit", map);
                list.add(cnt);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public void broadban(String mid) {
        try {
            int cnt = sqlSession.insert("stream.broadban", mid);
            if (cnt < 1) throw new Exception("정지정보 저장중 오류 발생");
            sqlSession.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            sqlSession.rollback();
        }
    }

    public int isban(String mid) {
        int cnt = 0;
        try {
            cnt = sqlSession.selectOne("stream.isban", mid);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return cnt;
        }
    }

    public void broadok(String mid) {
        try {
            int cnt = sqlSession.delete("stream.broadok", mid);
            if (cnt < 1) throw new Exception("정지정보 삭제중 오류 발생");
            sqlSession.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            sqlSession.rollback();
        }
    }

    public List<GCategoryVo> gcategory(String mid) {
        List<GCategoryVo> list = new ArrayList<GCategoryVo>();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("mid", mid);

            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = GregorianCalendar.getInstance();
            cal.setTime(new Date());
            cal.set(Calendar.DAY_OF_WEEK, 1); //이번주 시작일
            String s_day = format.format(cal.getTime());
            map.put("s_day", s_day);

            cal.set(Calendar.DAY_OF_WEEK, 7);
            cal.add(Calendar.DATE, 1);//날짜+1
            String l_day = format.format(cal.getTime());
            map.put("l_day", l_day);
            list = sqlSession.selectList("stream.gcategory", map);

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<GCategoryVo> gcategory_m(String mid) {
        List<GCategoryVo> list = new ArrayList<GCategoryVo>();
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            DecimalFormat df = new DecimalFormat("00");
            Calendar currentCalendar = Calendar.getInstance();
            String month = df.format(currentCalendar.get(Calendar.MONTH) + 1);
            String year = df.format(currentCalendar.get(Calendar.YEAR));
            map.put("mid", mid);
            map.put("month", month);
            map.put("year", year);
            list = sqlSession.selectList("stream.gcategory_m", map);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<GCategoryVo> gcategory_y(String mid) {
        List<GCategoryVo> list = new ArrayList<GCategoryVo>();
        Map<String, Object> map = new HashMap<String, Object>();

        try {
            DecimalFormat df = new DecimalFormat("00");
            Calendar currentCalendar = Calendar.getInstance();
            String year = df.format(currentCalendar.get(Calendar.YEAR));

            map.put("mid", mid);
            map.put("year", year);

            list = sqlSession.selectList("stream.gcategory_y", map);

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<StreamerVo> d_profit() {
        List<StreamerVo> list = new ArrayList<StreamerVo>();
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            DecimalFormat df = new DecimalFormat("00");
            Calendar currentCalendar = Calendar.getInstance();
            String year = df.format(currentCalendar.get(Calendar.YEAR));

            map.put("year", year);
            list = sqlSession.selectList("stream.d_profit", map);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<StreamerVo> d_profit2(Page p) {
        List<StreamerVo> list = new ArrayList<StreamerVo>();
        try {
            list = sqlSession.selectList("stream.d_profit2", p);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<StreamerVo> s_profit(Page p) {
        List<StreamerVo> list = new ArrayList<StreamerVo>();
        try {
            p.pageCompute();
            list = sqlSession.selectList("stream.s_profit", p);
            p.setTotListSize(list.size());
            p.pageCompute();

            list = sqlSession.selectList("stream.s_profit2", p);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<StatisticVo> done_profit() {
        List<StatisticVo> list = new ArrayList<StatisticVo>();
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            DecimalFormat df = new DecimalFormat("00");
            Calendar currentCalendar = Calendar.getInstance();
            String year = df.format(currentCalendar.get(Calendar.YEAR));

            map.put("year", year);
            list = sqlSession.selectList("stream.done_profit", map);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<StatisticVo> sub_profit() {
        List<StatisticVo> list = new ArrayList<StatisticVo>();
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            DecimalFormat df = new DecimalFormat("00");
            Calendar currentCalendar = Calendar.getInstance();
            String year = df.format(currentCalendar.get(Calendar.YEAR));

            map.put("year", year);
            list = sqlSession.selectList("stream.sub_profit", map);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<StatisticVo> payment() {
        List<StatisticVo> list = new ArrayList<StatisticVo>();
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            DecimalFormat df = new DecimalFormat("00");
            Calendar currentCalendar = Calendar.getInstance();
            String year = df.format(currentCalendar.get(Calendar.YEAR));

            map.put("year", year);
            list = sqlSession.selectList("stream.payment", map);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<StreamingVo> onair() {
        List<StreamingVo> list = new ArrayList<StreamingVo>();
        try {
            list = sqlSession.selectList("stream.onair");
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<StatisticVo> mileage(String mid) {
        List<StatisticVo> list = new ArrayList<StatisticVo>();
        try {
            list = sqlSession.selectList("stream.mileage", mid);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<StatisticVo> mileage_use(String mid) {
        List<StatisticVo> list = new ArrayList<StatisticVo>();
        try {
            list = sqlSession.selectList("stream.mileage_use", mid);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> Watching(String mid) {
        List<String> list = new ArrayList<String>();
        Map<String, Object> map = new HashMap<String, Object>();
        DecimalFormat df = new DecimalFormat("00");
        Calendar currentCalendar = Calendar.getInstance();
        String year = df.format(currentCalendar.get(Calendar.YEAR));

        map.put("year", year);
        map.put("mid", mid);
        try {
            for (int i = 1; i < 13; i++) {
                map.put("month", i);
                String cnt = sqlSession.selectOne("stream.watching_time", map);
                if (cnt == null) {
                    list.add("0");
                } else {
                    list.add(cnt);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public String Watching_tot(String mid) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("mid", mid);
        String cnt = null;
        try {
            cnt = sqlSession.selectOne("stream.watching_tot", map);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return cnt;
        }
    }

    public List<StatisticVo> last_pay(String mid) {
        List<StatisticVo> list = new ArrayList<StatisticVo>();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("mid", mid);

        DecimalFormat df = new DecimalFormat("00");
        Calendar currentCalendar = Calendar.getInstance();
        String year = df.format(currentCalendar.get(Calendar.YEAR));

        map.put("year", year);
        try {
            list = sqlSession.selectList("stream.last_pay", map);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public String last_pay_tot(String mid) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("mid", mid);
        String cnt = null;
        try {
            cnt = sqlSession.selectOne("stream.last_pay_tot", map);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return cnt;
        }
    }

    public List<UserProductVo> store_cate(String mid) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("mid", mid);
        List<UserProductVo> list = new ArrayList<UserProductVo>();
        try {
            list = sqlSession.selectList("stream.store_cate", map);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<UserProductVo> store_buylist(String mid) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("mid", mid);
        List<UserProductVo> list = new ArrayList<UserProductVo>();
        try {
            list = sqlSession.selectList("stream.store_buylist", map);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<String> now_live() {

        List<String> list = new ArrayList<String>();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = GregorianCalendar.getInstance();
        cal.setTime(new Date());
        String day = format.format(cal.getTime());

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("day", day);
        try {
            String cnt = sqlSession.selectOne("stream.now_live", map);//생방
            list.add(cnt);
            cnt = sqlSession.selectOne("stream.today_order", map);//오늘 주문 수
            list.add(cnt);
            cnt = sqlSession.selectOne("stream.today_review", map);//오늘 리뷰 수
            list.add(cnt);
            cnt = sqlSession.selectOne("stream.today_member", map);// 오늘 회원 수
            list.add(cnt);

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<OnAirVo> onAir() {
        List<OnAirVo> list = sqlSession.selectList("stream.onAir");
        return list;
    }

    public List<OnAirVo> onAir_cate() {
        List<OnAirVo> list = sqlSession.selectList("stream.onAir_cate");

        return list;
    }

    public List<UserProductVo> day_hit() {
        List<UserProductVo> list = new ArrayList<UserProductVo>();

        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = GregorianCalendar.getInstance();
        cal.setTime(new Date());
        String day = format.format(cal.getTime());

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("day", day);

        try {
            list = sqlSession.selectList("stream.onAir_shop", map);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return list;

    }

    public List<StatisticVo> main_profit() {
        List<StatisticVo> list = new ArrayList<StatisticVo>();
        try {
            Map<String, Object> map = new HashMap<String, Object>();

            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = GregorianCalendar.getInstance();
            cal.setTime(new Date());
            String day1 = format.format(cal.getTime());
            map.put("day1", day1);

            cal.add(Calendar.DATE, -4);//날짜-4
            String day2 = format.format(cal.getTime());
            map.put("day2", day2);

            list = sqlSession.selectList("stream.main_profit", map);

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<StatisticVo> main_profit2() {
        List<StatisticVo> list = new ArrayList<StatisticVo>();
        try {
            Map<String, Object> map = new HashMap<String, Object>();

            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = GregorianCalendar.getInstance();
            cal.setTime(new Date());
            String day1 = format.format(cal.getTime());
            map.put("day1", day1);

            cal.add(Calendar.DATE, -4);//날짜-4
            String day2 = format.format(cal.getTime());
            map.put("day2", day2);

            list = sqlSession.selectList("stream.main_profit2", map);

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return list;
        }
    }

    public List<GCategoryVo> userLikeCate(String mid) {
        List<GCategoryVo> list = new ArrayList<GCategoryVo>();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("mid", mid);
        try {
            list = sqlSession.selectList("stream.user_like_cate", map);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return list;
    }


}
