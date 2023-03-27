<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="../../resources/css/content-styles.css" type="text/css">
        <script type="text/javascript" src="../../resources/ckeditor/ckeditor.js"></script>
        <script src="../../resources/ckeditor/translations/ko.js"></script>

        <style>
        </style>
    </head>

    <body>
        <form action="" method="POST">
            <div id="itemDetail">
                <table>
                    <tr>
                        <td>브랜드 명</td>
                        <td><input type="text" placeholder="브랜드 명 입력"></td>
                    </tr>
                    <tr>
                    <tr>
                        <td>제품 명</td>
                        <td><input type="text" placeholder="제품 명 입력"></td>
                    </tr>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td><input type="text" placeholder="가격 입력"></td>
                    </tr>
                    <tr>
                        <td>발매가격</td>
                        <td><input type="text" placeholder="발매가격 입력"></td>
                    </tr>
                    <tr>
                        <td>분류</td>
                        <td>
                            <select name="category" id="category">
                                <option value="신발">신발</option>
                                <option value="아우터">아우터</option>
                                <option value="상의">상의</option>
                                <option value="하의">하의</option>
                                <option value="가방">가방</option>
                                <option value="지갑">지갑</option>
                                <option value="시계">시계</option>
                                <option value="패션잡화">패션잡화</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>성별</td>
                        <td>
                            <input type="radio" name="gender" value="M">남성
                            <input type="radio" name="gender" value="F">여성
                        </td>
                    </tr>
                    <tr>
                        <td>옵션</td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td>날씨</td>
                        <td>
                            <input type="checkbox" value="맑음">맑음
                            <input type="checkbox" value="흐림">흐림
                            <input type="checkbox" value="비">비
                            <input type="checkbox" value="눈">눈
                        </td>
                    </tr>
                    <tr>
                        <td>수량</td>
                        <td>
                            <input type="text" placeholder="총 수량 입력">
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            상세정보
                        </td>
                        <td>
                            <textarea name="text" id="editor"></textarea>
                            <p><input type="submit" value="전송"></p>
                        </td>
                    </tr>
                </table>
            </div>
            <script>
                ClassicEditor.create(document.querySelector('#editor'), { language: 'ko' });
            </script>
        </form>
    </body>

    </html>