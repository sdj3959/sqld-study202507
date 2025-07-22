-- ### 💪 4강 개념 다지기: 연습 문제

-- 자, 이제 함수 파트의 모든 것을 배웠습니다! 아래 문제들을 통해 데이터를 요리하는 실력을 점검해보세요.

-- **문제 1. 날짜를 내 마음대로!**

-- > POSTS 테이블에서 post_id가 4번인 게시물의 작성일(creation_date)을 '2023년 01월 01일 (일요일)' 과 같은
--  형식의 문자열로 바꿔서 보여주세요.
-- > 
SELECT TO_CHAR(creation_date, 'YYYY"년" MM"월" DD"일" (DAY)') AS "게시물 작성일"
FROM POSTS
WHERE post_id = 4
;

-- **문제 2. 매니저가 있나요?**

-- > USERS 테이블에서 모든 사용자의 username과 manager_id를 조회하되, manager_id가 NULL인 경우에는 
-- '최상위 관리자' 라는 글자가 대신 나오도록 조회해주세요. (NVL 사용)
-- > 
SELECT 
    username, 
    NVL(TO_CHAR(manager_id), '최상위 관리자') AS "매니저 ID"
FROM USERS
;

-- **문제 3. 활동 상태 표시하기**

-- > USERS 테이블에서 사용자의 마지막 로그인 날짜(last_login_date)를 기준으로, 2024년 1월 1일 이후에 로그인한 
-- 기록이 있으면 '최근 활동 유저', 그 이전이거나 없으면 '휴면 유저' 라고 '활동 상태' 컬럼에 표시해주세요. 
-- (CASE 사용)
-- > 
SELECT 
    username, 
    LAST_LOGIN_DATE,
    CASE 
        WHEN last_login_date >= TO_DATE('2024-01-01', 'YYYY-MM-DD') THEN '최근 활동 유저'
        ELSE '휴면 유저'
    END AS "활동 상태"
FROM USERS
;

-- **문제 4. 짝수/홀수 댓글 구분**

-- > COMMENTS 테이블에서 comment_id가 짝수이면 '짝수 댓글', 홀수이면 '홀수 댓글'이라고 표시하는 '댓글 유형' 
-- 컬럼을 추가하여 조회해주세요. (MOD와 CASE 사용)
-- >
SELECT 
    comment_id,
    CASE 
        WHEN MOD(comment_id, 2) = 0 THEN '짝수 댓글'
        ELSE '홀수 댓글'
    END AS "댓글 유형"
FROM COMMENTS
;