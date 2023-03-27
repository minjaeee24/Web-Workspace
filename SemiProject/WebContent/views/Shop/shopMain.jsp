<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="../../resources/css/shop-styles.css" type="text/css">
</head>
<style>
    #navibar{
        height: 86px;
    }
    *,
    :after,
    :before {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-tap-highlight-color: transparent;
    }
    li{
        list-style: none;
    }
    ul{
        margin: 0;
    }
    a{
        text-decoration: none;
    }
    .tab{
        display: flex;
        align-items: center;
        height: 44px;
        padding-top: 2px;
        font-size: 16px;
        color: #222;
        cursor: pointer;
        border-bottom: 2px solid #222;
        font-weight: 700;
    }
</style>

<body>
    <div id="navibar"></div>
    <div>
        <div id="searchbox">
            <div id="search">
                <input id="searchMain" type="text" placeholder="브랜드, 모델명, 모델번호 등">
                <img src="../../resources/symbols/x.png" id="deleteBtn">
            </div>
        </div>
        <div id="category">
            <ul id="categoryUl">
                <li class="categoryLi">전체</li>
                <li class="categoryLi">럭셔리</li>
                <li class="categoryLi">신발</li>
                <li class="categoryLi">아우터</li>
                <li class="categoryLi">상의</li>
                <li class="categoryLi">하의</li>
                <li class="categoryLi">가방</li>
                <li class="categoryLi">지갑</li>
                <li class="categoryLi">시계</li>
                <li class="categoryLi">패션잡화</li>
            </ul>
            <div>
                <ul id="weatherCategory">
                    <li>
                        <img src="../../resources/symbols/맑음.png" alt="" class="weather">
                    </li>
                    <li>
                        <img src="../../resources/symbols/흐림.png" alt="" class="weather">
                    </li>
                    <li>
                        <img src="../../resources/symbols/비.png" alt="" class="weather">
                    </li>
                    <li>
                        <img src="../../resources/symbols/눈.png" alt="" class="weather">
                    </li>
                    <li class="temper">
                        <img src="../../resources/symbols/기온.png" alt="" class="weather">
                        <div class="temperature">현재 기온</div>
                    </li>
                </ul>
            </div>
        </div>
        <div id="body">
            <aside id="mainFilter">
                <div id="filter">
                    <div class="aside1">
                        <div>
                            <span>필터</span>
                        </div>
                    </div>
                    <div class="contentFilter">
                        <div class="titleFilter">
                            <div class="titleBox">
                                <span class="mainTitle">카테고리</span>
                                <span class="subTitle" id="subTitle1">모든 카테고리</span>
                            </div>
                            <div class="titleBtn">
                                <img src="../../resources/symbols/+.png" alt="" class="filterPM filterPlus">
                                <img src="../../resources/symbols/-.png" alt="" class="filterPM filterMinus" style="display: none;">
                            </div>
                        </div>
                        <div class="filterCheck" id="filterCheck1" style="display: none;">
                            <ul class="filterCheckUl">
                                <li class="menu">
                                    <input type="checkbox" value="신발"><label for="" class="filterText">신발</label><br>
                                </li>
                                <li class="menu">
                                    <input type="checkbox" value="아우터"><label for="" class="filterText">아우터</label><br>
                                </li>
                                <li class="menu">
                                    <input type="checkbox" value="상의"><label for="" class="filterText">상의</label><br>
                                </li>
                                <li class="menu">
                                    <input type="checkbox" value="하의"><label for="" class="filterText">하의</label><br>
                                </li>
                                <li class="menu">
                                    <input type="checkbox" value="가방"><label for="" class="filterText">가방</label><br>
                                </li>
                                <li class="menu">
                                    <input type="checkbox" value="지갑"><label for="" class="filterText">지갑</label><br>
                                </li>
                                <li class="menu">
                                    <input type="checkbox" value="시계"><label for="" class="filterText">시계</label><br>
                                </li>
                                <li class="menu">
                                    <input type="checkbox" value="패션잡화"><label for="" class="filterText">패션잡화</label>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- $('.titleFilter').each(function(index, e) {
                        $(e).click(function() {
                            $(this).children().children('.titleBtn').children('.filterPlus').css('display', 'none');
                            $(this).next().css('display','block');
                            $(this).parent().parent().find('.subTitle').css('display','none');
                            $(this).parent().parent().parent().find('.filterCheck').css('display','block');
                        });
                    }); -->
                    <div class="contentFilter">
                        <div class="titleFilter">
                            <div class="titleBox">
                                <span class="mainTitle">성별</span>
                                <span class="subTitle" id="subTitle2">모든 성별</span>
                            </div>
                            <div class="titleBtn">
                                <img src="../../resources/symbols/+.png" alt="" class="filterPM filterPlus">
                                <img src="../../resources/symbols/-.png" alt="" class="filterPM filterMinus" style="display: none;">
                            </div>
                        </div>
                        <div class="filterCheck" id="filterCheck2" style="display: none;">
                            <ul class="filterCheckUl">
                                <li class="menu">
                                    <input type="checkbox" value="남성"><label for="" class="filterText">남성</label><br>
                                </li>
                                <li class="menu">
                                    <input type="checkbox" value="여성"><label for="" class="filterText">여성</label><br>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="contentFilter">
                        <div class="titleFilter">
                            <div class="titleBox">
                                <span class="mainTitle">브랜드</span>
                                <span class="subTitle" id="subTitle1">모든 브랜드</span>
                            </div>
                            <div class="titleBtn">
                                <img src="../../resources/symbols/+.png" alt="" class="filterPM filterPlus">
                                <img src="../../resources/symbols/-.png" alt="" class="filterPM filterMinus" style="display: none;">
                            </div>
                        </div>
                        <div class="filterCheck" id="filterCheck1" style="display: none;">
                            <ul class="filterCheckUl">
                                <li class="menu">
                                    <input type="checkbox" value=""><label for="" class="filterText"></label><br><!-- 브랜드 종류 -->
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="contentFilter">
                        <div class="titleFilter">
                            <div class="titleBox">
                                <span class="mainTitle">사이즈</span>
                                <span class="subTitle" id="subTitle1">모든 사이즈</span>
                            </div>
                            <div class="titleBtn">
                                <img src="../../resources/symbols/+.png" alt="" class="filterPM filterPlus">
                                <img src="../../resources/symbols/-.png" alt="" class="filterPM filterMinus" style="display: none;">
                            </div>
                        </div>
                        <div class="filterCheck" id="filterCheck1" style="display: none;">
                            <ul class="filterCheckUl">                    
                                <li class="menu">
                                    <p class="filterText" style="margin-top: 0px;">신발</p>
                                    <div>
                                        <div id="columnMenu">
                                            <a href="" class="columnMenu">215</a>
                                            <a href="" class="columnMenu">220</a>
                                            <a href="" class="columnMenu">225</a>
                                            <a href="" class="columnMenu">230</a>
                                            <a href="" class="columnMenu">235</a>
                                            <a href="" class="columnMenu">240</a>
                                            <a href="" class="columnMenu">245</a>
                                            <a href="" class="columnMenu">250</a>
                                            <a href="" class="columnMenu">255</a>
                                            <a href="" class="columnMenu">260</a>
                                            <a href="" class="columnMenu">265</a>
                                            <a href="" class="columnMenu">270</a>
                                            <a href="" class="columnMenu">275</a>
                                            <a href="" class="columnMenu">280</a>
                                            <a href="" class="columnMenu">285</a>
                                            <a href="" class="columnMenu">290</a>
                                            <a href="" class="columnMenu">295</a>
                                            <a href="" class="columnMenu">300</a>
                                            <a href="" class="columnMenu">305</a>
                                            <a href="" class="columnMenu">310</a>
                                            <a href="" class="columnMenu">315</a>
                                            <a href="" class="columnMenu">320</a>
                                            <a href="" class="columnMenu">325</a>
                                            <a href="" class="columnMenu">330</a>
                                        </div>
                                    </div>
                                </li>
                                <li class="menu">
                                    <p class="filterText">의류</p>
                                    <div class="clothMenu">
                                        <div id="columnMenu" class="">
                                            <a href="" class="columnMenu clothSize">XXS</a>
                                            <a href="" class="columnMenu clothSize">XS</a>
                                            <a href="" class="columnMenu clothSize">S</a>
                                            <a href="" class="columnMenu clothSize">M</a>
                                            <a href="" class="columnMenu clothSize">L</a>
                                            <a href="" class="columnMenu clothSize">XL</a>
                                            <a href="" class="columnMenu clothSize">XXL</a>
                                            <a href="" class="columnMenu clothSize">XXXL</a>
                                        </div>
                                    </div>
                                    <div class="clothMenu">
                                        <div id="columnMenu">
                                            <a href="" class="columnMenu">28</a>
                                            <a href="" class="columnMenu">29</a>
                                            <a href="" class="columnMenu">30</a>
                                            <a href="" class="columnMenu">31</a>
                                            <a href="" class="columnMenu">32</a>
                                            <a href="" class="columnMenu">33</a>
                                            <a href="" class="columnMenu">34</a>
                                            <a href="" class="columnMenu">35</a>
                                            <a href="" class="columnMenu">36</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="contentFilter">
                        <div class="titleFilter">
                            <div class="titleBox">
                                <span class="mainTitle">혜택/가격</span>
                                <span class="subTitle" id="subTitle1">모든 혜택/가격</span>
                            </div>
                            <div class="titleBtn">
                                <img src="../../resources/symbols/+.png" alt="" class="filterPM filterPlus">
                                <img src="../../resources/symbols/-.png" alt="" class="filterPM filterMinus" style="display: none;">
                            </div>
                        </div>
                        <div class="filterCheck" id="filterCheck1" style="display: none;">
                            <ul class="filterCheckUl">
                                <li class="menu">
                                    <span class="filterText">혜택</span><br>
                                    <div class="priceFilter">
                                        <input type="checkbox" value="무료배송"><label for="" class="filterText">무료배송</label><br>
                                    </div>
                                    <div class="priceFilter">
                                        <input type="checkbox" value="할인"><label for="" class="filterText">할인</label><br>
                                    </div>
                                </li>
                                <li class="menu" style="margin-top: 10px;">
                                    <span class="filterText">가격</span><br>
                                    <div class="priceFilter">
                                        <input type="checkbox" value="10만원 이하"><label for="" class="filterText">10만원 이하</label><br>
                                    </div>
                                    <div class="priceFilter">
                                        <input type="checkbox" value="10-30만원"><label for="" class="filterText">10-30만원</label><br>
                                    </div>
                                    <div class="priceFilter">
                                        <input type="checkbox" value="30-50만원"><label for="" class="filterText">30-50만원</label><br>
                                    </div>
                                    <div class="priceFilter">
                                        <input type="checkbox" value="50-100만원"><label for="" class="filterText">50-100만원</label><br>
                                    </div>
                                    <div class="priceFilter">
                                        <input type="checkbox" value="100-300만원"><label for="" class="filterText">100-300만원</label><br>
                                    </div>
                                    <div class="priceFilter">
                                        <input type="checkbox" value="300만원 이상"><label for="" class="filterText">300만원 이상</label><br>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </aside>
            <div id="mainContent">
                <div id="showFilter">
                    <div>상품</div> <!-- 총 상품 개수 -->
                    <div><< < 1 2 3 4 5 6 7 8 9 10 > >></div> <!-- 페이징 바. 위치 고민 -->
                    <div>필터</div> <!-- 필터 기능 -->
                </div>
                <div id="content">
                    <div>
                        <a href="">
                            <div>
                                <img src="../../resources/symbols/sample.jpg" alt="" class="productImg">
                            </div>
                            <div class="productInner">
                                <div class="productBrand">Hermes</div>
                                <div class="productName">(W) Hermes Mini Pop H Pendant Rose Gold & Blanc</div>
                                <div class="productPrice">850,000원</div>
                            </div>
                        </a>
                        <div class="productWish">
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <path d="M0,0 L15,0 L15,15 L11.25,12.25 L7.5,9.5 L3.25,12.25 L0,15 L0,10 Z" fill="none" stroke="#000000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <rect x="0" y="0" width="15" height="15" fill="#fff" stroke="#000" stroke-width="1" />
                                    <path d="M6.5 9.2c-1.88-1.85-3.67-3.44-3.67-4.84 0-1.28 1.04-1.76 1.79-1.76 0.44 0 1.39 0.17 1.92 1.5 0.53-1.32 1.49-1.48 1.92-1.48 0.85 0 1.76 0.54 1.76 1.72 0 1.69-2.13 3.59-4.5 6.01m1.92-8.63c-0.7 0-1.42 0.33-1.84 1.02-0.42-0.72-1.15-1.06-1.88-1.06-1.05 0-2.08 0.72-2.08 2.04 0 1.54 1.84 3.11 4 5.24 2.16-2.13 4-3.71 4-5.24 0-1.33-1.03-2.05-2.09-2.05" fill="#000" stroke="#000" stroke-width="0"/>
                                    <line x1="2" y1="11" x2="13" y2="11" stroke="#000" stroke-width="1" />
                                    <line x1="2" y1="13" x2="10.5" y2="13" stroke="#000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <a href="">
                            <div>
                                <img src="../../resources/symbols/sample.jpg" alt="" class="productImg">
                            </div>
                            <div class="productInner">
                                <div class="productBrand">Hermes</div>
                                <div class="productName">(W) Hermes Mini Pop H Pendant Rose Gold & Blanc</div>
                                <div class="productPrice">850,000원</div>
                            </div>
                        </a>
                        <div class="productWish">
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <path d="M0,0 L15,0 L15,15 L11.25,12.25 L7.5,9.5 L3.25,12.25 L0,15 L0,10 Z" fill="none" stroke="#000000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <rect x="0" y="0" width="15" height="15" fill="#fff" stroke="#000" stroke-width="1" />
                                    <path d="M6.5 9.2c-1.88-1.85-3.67-3.44-3.67-4.84 0-1.28 1.04-1.76 1.79-1.76 0.44 0 1.39 0.17 1.92 1.5 0.53-1.32 1.49-1.48 1.92-1.48 0.85 0 1.76 0.54 1.76 1.72 0 1.69-2.13 3.59-4.5 6.01m1.92-8.63c-0.7 0-1.42 0.33-1.84 1.02-0.42-0.72-1.15-1.06-1.88-1.06-1.05 0-2.08 0.72-2.08 2.04 0 1.54 1.84 3.11 4 5.24 2.16-2.13 4-3.71 4-5.24 0-1.33-1.03-2.05-2.09-2.05" fill="#000" stroke="#000" stroke-width="0"/>
                                    <line x1="2" y1="11" x2="13" y2="11" stroke="#000" stroke-width="1" />
                                    <line x1="2" y1="13" x2="10.5" y2="13" stroke="#000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                        </div>
                    </div><div>
                        <a href="">
                            <div>
                                <img src="../../resources/symbols/sample.jpg" alt="" class="productImg">
                            </div>
                            <div class="productInner">
                                <div class="productBrand">Hermes</div>
                                <div class="productName">(W) Hermes Mini Pop H Pendant Rose Gold & Blanc</div>
                                <div class="productPrice">850,000원</div>
                            </div>
                        </a>
                        <div class="productWish">
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <path d="M0,0 L15,0 L15,15 L11.25,12.25 L7.5,9.5 L3.25,12.25 L0,15 L0,10 Z" fill="none" stroke="#000000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <rect x="0" y="0" width="15" height="15" fill="#fff" stroke="#000" stroke-width="1" />
                                    <path d="M6.5 9.2c-1.88-1.85-3.67-3.44-3.67-4.84 0-1.28 1.04-1.76 1.79-1.76 0.44 0 1.39 0.17 1.92 1.5 0.53-1.32 1.49-1.48 1.92-1.48 0.85 0 1.76 0.54 1.76 1.72 0 1.69-2.13 3.59-4.5 6.01m1.92-8.63c-0.7 0-1.42 0.33-1.84 1.02-0.42-0.72-1.15-1.06-1.88-1.06-1.05 0-2.08 0.72-2.08 2.04 0 1.54 1.84 3.11 4 5.24 2.16-2.13 4-3.71 4-5.24 0-1.33-1.03-2.05-2.09-2.05" fill="#000" stroke="#000" stroke-width="0"/>
                                    <line x1="2" y1="11" x2="13" y2="11" stroke="#000" stroke-width="1" />
                                    <line x1="2" y1="13" x2="10.5" y2="13" stroke="#000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                        </div>
                    </div><div>
                        <a href="">
                            <div>
                                <img src="sample.jpg" alt="" class="productImg">
                            </div>
                            <div class="productInner">
                                <div class="productBrand">Hermes</div>
                                <div class="productName">(W) Hermes Mini Pop H Pendant Rose Gold & Blanc</div>
                                <div class="productPrice">850,000원</div>
                            </div>
                        </a>
                        <div class="productWish">
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <path d="M0,0 L15,0 L15,15 L11.25,12.25 L7.5,9.5 L3.25,12.25 L0,15 L0,10 Z" fill="none" stroke="#000000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <rect x="0" y="0" width="15" height="15" fill="#fff" stroke="#000" stroke-width="1" />
                                    <path d="M6.5 9.2c-1.88-1.85-3.67-3.44-3.67-4.84 0-1.28 1.04-1.76 1.79-1.76 0.44 0 1.39 0.17 1.92 1.5 0.53-1.32 1.49-1.48 1.92-1.48 0.85 0 1.76 0.54 1.76 1.72 0 1.69-2.13 3.59-4.5 6.01m1.92-8.63c-0.7 0-1.42 0.33-1.84 1.02-0.42-0.72-1.15-1.06-1.88-1.06-1.05 0-2.08 0.72-2.08 2.04 0 1.54 1.84 3.11 4 5.24 2.16-2.13 4-3.71 4-5.24 0-1.33-1.03-2.05-2.09-2.05" fill="#000" stroke="#000" stroke-width="0"/>
                                    <line x1="2" y1="11" x2="13" y2="11" stroke="#000" stroke-width="1" />
                                    <line x1="2" y1="13" x2="10.5" y2="13" stroke="#000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                        </div>
                    </div><div>
                        <a href="">
                            <div>
                                <img src="sample.jpg" alt="" class="productImg">
                            </div>
                            <div class="productInner">
                                <div class="productBrand">Hermes</div>
                                <div class="productName">(W) Hermes Mini Pop H Pendant Rose Gold & Blanc</div>
                                <div class="productPrice">850,000원</div>
                            </div>
                        </a>
                        <div class="productWish">
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <path d="M0,0 L15,0 L15,15 L11.25,12.25 L7.5,9.5 L3.25,12.25 L0,15 L0,10 Z" fill="none" stroke="#000000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <rect x="0" y="0" width="15" height="15" fill="#fff" stroke="#000" stroke-width="1" />
                                    <path d="M6.5 9.2c-1.88-1.85-3.67-3.44-3.67-4.84 0-1.28 1.04-1.76 1.79-1.76 0.44 0 1.39 0.17 1.92 1.5 0.53-1.32 1.49-1.48 1.92-1.48 0.85 0 1.76 0.54 1.76 1.72 0 1.69-2.13 3.59-4.5 6.01m1.92-8.63c-0.7 0-1.42 0.33-1.84 1.02-0.42-0.72-1.15-1.06-1.88-1.06-1.05 0-2.08 0.72-2.08 2.04 0 1.54 1.84 3.11 4 5.24 2.16-2.13 4-3.71 4-5.24 0-1.33-1.03-2.05-2.09-2.05" fill="#000" stroke="#000" stroke-width="0"/>
                                    <line x1="2" y1="11" x2="13" y2="11" stroke="#000" stroke-width="1" />
                                    <line x1="2" y1="13" x2="10.5" y2="13" stroke="#000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                        </div>
                    </div><div>
                        <a href="">
                            <div>
                                <img src="sample.jpg" alt="" class="productImg">
                            </div>
                            <div class="productInner">
                                <div class="productBrand">Hermes</div>
                                <div class="productName">(W) Hermes Mini Pop H Pendant Rose Gold & Blanc</div>
                                <div class="productPrice">850,000원</div>
                            </div>
                        </a>
                        <div class="productWish">
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <path d="M0,0 L15,0 L15,15 L11.25,12.25 L7.5,9.5 L3.25,12.25 L0,15 L0,10 Z" fill="none" stroke="#000000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <rect x="0" y="0" width="15" height="15" fill="#fff" stroke="#000" stroke-width="1" />
                                    <path d="M6.5 9.2c-1.88-1.85-3.67-3.44-3.67-4.84 0-1.28 1.04-1.76 1.79-1.76 0.44 0 1.39 0.17 1.92 1.5 0.53-1.32 1.49-1.48 1.92-1.48 0.85 0 1.76 0.54 1.76 1.72 0 1.69-2.13 3.59-4.5 6.01m1.92-8.63c-0.7 0-1.42 0.33-1.84 1.02-0.42-0.72-1.15-1.06-1.88-1.06-1.05 0-2.08 0.72-2.08 2.04 0 1.54 1.84 3.11 4 5.24 2.16-2.13 4-3.71 4-5.24 0-1.33-1.03-2.05-2.09-2.05" fill="#000" stroke="#000" stroke-width="0"/>
                                    <line x1="2" y1="11" x2="13" y2="11" stroke="#000" stroke-width="1" />
                                    <line x1="2" y1="13" x2="10.5" y2="13" stroke="#000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                        </div>
                    </div><div>
                        <a href="">
                            <div>
                                <img src="sample.jpg" alt="" class="productImg">
                            </div>
                            <div class="productInner">
                                <div class="productBrand">Hermes</div>
                                <div class="productName">(W) Hermes Mini Pop H Pendant Rose Gold & Blanc</div>
                                <div class="productPrice">850,000원</div>
                            </div>
                        </a>
                        <div class="productWish">
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <path d="M0,0 L15,0 L15,15 L11.25,12.25 L7.5,9.5 L3.25,12.25 L0,15 L0,10 Z" fill="none" stroke="#000000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <rect x="0" y="0" width="15" height="15" fill="#fff" stroke="#000" stroke-width="1" />
                                    <path d="M6.5 9.2c-1.88-1.85-3.67-3.44-3.67-4.84 0-1.28 1.04-1.76 1.79-1.76 0.44 0 1.39 0.17 1.92 1.5 0.53-1.32 1.49-1.48 1.92-1.48 0.85 0 1.76 0.54 1.76 1.72 0 1.69-2.13 3.59-4.5 6.01m1.92-8.63c-0.7 0-1.42 0.33-1.84 1.02-0.42-0.72-1.15-1.06-1.88-1.06-1.05 0-2.08 0.72-2.08 2.04 0 1.54 1.84 3.11 4 5.24 2.16-2.13 4-3.71 4-5.24 0-1.33-1.03-2.05-2.09-2.05" fill="#000" stroke="#000" stroke-width="0"/>
                                    <line x1="2" y1="11" x2="13" y2="11" stroke="#000" stroke-width="1" />
                                    <line x1="2" y1="13" x2="10.5" y2="13" stroke="#000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                        </div>
                    </div><div>
                        <a href="">
                            <div>
                                <img src="sample.jpg" alt="" class="productImg">
                            </div>
                            <div class="productInner">
                                <div class="productBrand">Hermes</div>
                                <div class="productName">(W) Hermes Mini Pop H Pendant Rose Gold & Blanc</div>
                                <div class="productPrice">850,000원</div>
                            </div>
                        </a>
                        <div class="productWish">
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <path d="M0,0 L15,0 L15,15 L11.25,12.25 L7.5,9.5 L3.25,12.25 L0,15 L0,10 Z" fill="none" stroke="#000000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <rect x="0" y="0" width="15" height="15" fill="#fff" stroke="#000" stroke-width="1" />
                                    <path d="M6.5 9.2c-1.88-1.85-3.67-3.44-3.67-4.84 0-1.28 1.04-1.76 1.79-1.76 0.44 0 1.39 0.17 1.92 1.5 0.53-1.32 1.49-1.48 1.92-1.48 0.85 0 1.76 0.54 1.76 1.72 0 1.69-2.13 3.59-4.5 6.01m1.92-8.63c-0.7 0-1.42 0.33-1.84 1.02-0.42-0.72-1.15-1.06-1.88-1.06-1.05 0-2.08 0.72-2.08 2.04 0 1.54 1.84 3.11 4 5.24 2.16-2.13 4-3.71 4-5.24 0-1.33-1.03-2.05-2.09-2.05" fill="#000" stroke="#000" stroke-width="0"/>
                                    <line x1="2" y1="11" x2="13" y2="11" stroke="#000" stroke-width="1" />
                                    <line x1="2" y1="13" x2="10.5" y2="13" stroke="#000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                        </div>
                    </div><div>
                        <a href="">
                            <div>
                                <img src="sample.jpg" alt="" class="productImg">
                            </div>
                            <div class="productInner">
                                <div class="productBrand">Hermes</div>
                                <div class="productName">(W) Hermes Mini Pop H Pendant Rose Gold & Blanc</div>
                                <div class="productPrice">850,000원</div>
                            </div>
                        </a>
                        <div class="productWish">
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <path d="M0,0 L15,0 L15,15 L11.25,12.25 L7.5,9.5 L3.25,12.25 L0,15 L0,10 Z" fill="none" stroke="#000000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <rect x="0" y="0" width="15" height="15" fill="#fff" stroke="#000" stroke-width="1" />
                                    <path d="M6.5 9.2c-1.88-1.85-3.67-3.44-3.67-4.84 0-1.28 1.04-1.76 1.79-1.76 0.44 0 1.39 0.17 1.92 1.5 0.53-1.32 1.49-1.48 1.92-1.48 0.85 0 1.76 0.54 1.76 1.72 0 1.69-2.13 3.59-4.5 6.01m1.92-8.63c-0.7 0-1.42 0.33-1.84 1.02-0.42-0.72-1.15-1.06-1.88-1.06-1.05 0-2.08 0.72-2.08 2.04 0 1.54 1.84 3.11 4 5.24 2.16-2.13 4-3.71 4-5.24 0-1.33-1.03-2.05-2.09-2.05" fill="#000" stroke="#000" stroke-width="0"/>
                                    <line x1="2" y1="11" x2="13" y2="11" stroke="#000" stroke-width="1" />
                                    <line x1="2" y1="13" x2="10.5" y2="13" stroke="#000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                        </div>
                    </div><div>
                        <a href="">
                            <div>
                                <img src="sample.jpg" alt="" class="productImg">
                            </div>
                            <div class="productInner">
                                <div class="productBrand">Hermes</div>
                                <div class="productName">(W) Hermes Mini Pop H Pendant Rose Gold & Blanc</div>
                                <div class="productPrice">850,000원</div>
                            </div>
                        </a>
                        <div class="productWish">
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <path d="M0,0 L15,0 L15,15 L11.25,12.25 L7.5,9.5 L3.25,12.25 L0,15 L0,10 Z" fill="none" stroke="#000000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                            <div class="interestWish">
                                <svg width="15" height="15">
                                    <rect x="0" y="0" width="15" height="15" fill="#fff" stroke="#000" stroke-width="1" />
                                    <path d="M6.5 9.2c-1.88-1.85-3.67-3.44-3.67-4.84 0-1.28 1.04-1.76 1.79-1.76 0.44 0 1.39 0.17 1.92 1.5 0.53-1.32 1.49-1.48 1.92-1.48 0.85 0 1.76 0.54 1.76 1.72 0 1.69-2.13 3.59-4.5 6.01m1.92-8.63c-0.7 0-1.42 0.33-1.84 1.02-0.42-0.72-1.15-1.06-1.88-1.06-1.05 0-2.08 0.72-2.08 2.04 0 1.54 1.84 3.11 4 5.24 2.16-2.13 4-3.71 4-5.24 0-1.33-1.03-2.05-2.09-2.05" fill="#000" stroke="#000" stroke-width="0"/>
                                    <line x1="2" y1="11" x2="13" y2="11" stroke="#000" stroke-width="1" />
                                    <line x1="2" y1="13" x2="10.5" y2="13" stroke="#000" stroke-width="1" />
                                </svg>
                                <div class="wishText">300</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        
        $('#deleteBtn').click(function() {
            $('#searchMain').val("");
        });

        $('.categoryLi').click(function() {
            $('.categoryLi').removeClass('tab');
            $(this).addClass('tab');
        });
        
        $('.titleFilter').each(function(index, e) {
            $(e).click(function() {       
                
                let filterPlus = $(this).children('.titleBtn').children('.filterPlus');
                let subTitle = $(this).find('.subTitle');
                let filterCheck = $(this).parent().find('.filterCheck');
                
                if (filterPlus.css('display') === 'block') {
                    filterPlus.css('display', 'none');
                    filterPlus.next().css('display','block');
                    subTitle.css('display','none');
                    filterCheck.css('display','block');
                } else {
                    filterPlus.css('display', 'block');
                    filterPlus.next().css('display','none');
                    subTitle.css('display','block');
                    filterCheck.css('display','none');
                }
            });
        });
        
        // $('.titleFilter').each(function(index, e) {
        //     $(e).click(function() {
        //         $(this).children('.titleBtn').children('.filterPlus').css('display', 'none');
        //         $(this).children('.titleBtn').children('.filterPlus').next().css('display','block');
        //         $(this).find('.subTitle').css('display','none');
        //         $(this).parent().find('.filterCheck').css('display','block');
        //     });
        // });
        
        // $('.filterMinus').each(function(index, e) {
        //     $(e).click(function() {
        //         $(this).css('display', 'none');
        //         $(this).parent().find('.filterPlus').css('display', 'block');
        //         $(this).parent().parent().find('.subTitle').css('display','block');
        //         $(this).parent().parent().parent().find('.filterCheck').css('display','none');
        //     });
        // });
    </script>
</body>

</html>