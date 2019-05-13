<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="content-type" content="no-cache, must-revalidate" />
    <title>在线教育网--${courseBase.name}</title>
</head>
<body data-spy="scroll" data-target="#articleNavbar" data-offset="150">
<!-- 页面头部 -->
<!--#include virtual="/include/header.html"-->
<div id="body">
<!--页面头部结束sss-->
<div class="article-banner">
    <div class="banner-bg"></div>
    <div class="banner-info">
        <div class="banner-left">
            <p class="tit">${courseBase.name}</p>
            <p class="pic"><span class="new-pic">特惠价格￥${(courseMarket.price)!""}</span> <span class="old-pic">原价￥${(courseMarket.price_old)!""}</span></p>
            <p class="info">
                <a href="http://ucenter.xuecheng.com/#/learning/${courseBase.id}/0"  target="_blank" v-if="learnstatus == 1" v-cloak>马上学习</a>
                <a href="#"  @click="addopencourse" v-if="learnstatus == 2" v-cloak>立即报名</a>
                <a href="#"  @click="buy" v-if="learnstatus == 3" v-cloak>立即购买</a>
                <span><em>难度等级</em>
		 <#if courseBase.grade=='200001'>
		低级
                <#elseif courseBase.grade=='200002'>
		中级
		 <#elseif courseBase.grade=='200003'>
		高级
		</#if>
                </span>
                <span><em>课程时长</em><stat v-text="course_stat.s601001"></stat>
                </span>
                <span><em>评分</em><stat v-text="course_stat.s601002"></stat></span>
                <span><em>授课模式</em>
                  <#if courseBase.studymodel=='201001'>
		自由学习
                <#elseif courseBase.studymodel=='201002'>
		任务式学习
		</#if>
                </span>
            </p>
        </div>
        <div class="banner-rit">
	    
	    <#if (coursePic.pic)??>
	     <p><img src="http://img.xuecheng.com/${coursePic.pic}" alt="" width="270" height="156"> </p>
	     <#else>
		 <p><img src="/static/img/widget-video.png" alt="" width="270" height="156"> </p>
	    </#if>
           
            <p class="vid-act"><span> <i class="i-heart"></i>收藏 <stat v-text="course_stat.s601003"></stat> </span> <span>分享 <i class="i-weixin"></i><i class="i-qq"></i></span></p>
        </div>
    </div>
</div>
<div class="article-cont">
    <div class="tit-list">
        <a href="javascript:;" id="articleClass" class="active">课程介绍</a>
        <a href="javascript:;" id="articleItem">目录</a>
        <!--<a href="javascript:;" id="artcleAsk">问答</a>-->
        <!--<div class="down-fill">
            <span>资料下载</span>
            <ul>
                <li>java视频资料</li>
                <li>java视频资料</li>
                <li>java视频资料</li>
            </ul>
        </div>-->
    </div>
    <div class="article-box">
        <div class="articleClass" style="display: block">
            <!--<div class="rit-title">评价</div>-->
            <div class="article-cont">
                <div class="article-left-box">
                    <div class="content">

                        <div class="content-com suit">
                            <div class="title"><span>适用人群</span></div>
                            <div class="cont cktop">
                                <div >
                                    <p>${(courseBase.users)!""}</p>
                                </div>
                                <!--<span class="on-off">更多 <i class="i-chevron-bot"></i></span>-->
                            </div>
                        </div>
                        <div class="content-com course">
                            <div class="title"><span>课程制作</span></div>
                            <!--#include virtual="/teacher/teacher_info_template01.html"-->

                        </div>
                        <div class="content-com about">
                            <div class="title"><span>课程介绍</span></div>
                            <div class="cont cktop">
                                <div >
                                    <p>${(courseBase.description)!""}</p>
                                </div>
                                <!--<span class="on-off">更多 <i class="i-chevron-bot"></i></span>-->
                            </div>
                        </div>
                        <div class="content-com prob">
                            <div class="title"><span>常见问题</span></div>
                            <div class="cont">
                                <ul>
                                    <li class="item"><span class="on-off"><i class="i-chevron-bot"></i> 我什么时候能够访问课程视频与作业？</span>
                                        <div class="drop-down">
                                            <p>课程安排灵活，课程费用支付提供180天全程准入和资格证书。自定进度课程建议的最后期限，但你不会受到惩罚错过期限，只要你赚你的证书在180天内。以会话为基础的课程可能要求你在截止日期前保持正轨，但如果你落后了，你可以切换到以后的会议，你完成的任何工作将与你转移。</p>
                                        </div>
                                    </li>
                                    <li class="item"><span class="on-off"><i class="i-chevron-bot"></i> 如何需要额外的时间来完成课程会怎么样？</span>
                                        <div class="drop-down">
                                            <p>课程安排灵活，课程费用支付提供180天全程准入和资格证书。自定进度课程建议的最后期限，但你不会受到惩罚错过期限，只要你赚你的证书在180天内。以会话为基础的课程可能要求你在截止日期前保持正轨，但如果你落后了，你可以切换到以后的会议，你完成的任何工作将与你转移。</p>
                                        </div>
                                    </li>
                                    <li class="item"><span class="on-off"><i class="i-chevron-bot"></i> 我支付次课程之后会得到什么？</span>
                                        <div class="drop-down">
                                            <p>课程安排灵活，课程费用支付提供180天全程准入和资格证书。自定进度课程建议的最后期限，但你不会受到惩罚错过期限，只要你赚你的证书在180天内。以会话为基础的课程可能要求你在截止日期前保持正轨，但如果你落后了，你可以切换到以后的会议，你完成的任何工作将与你转移。</p>
                                        </div>
                                    </li>
                                    <li class="item"><span class="on-off"><i class="i-chevron-bot"></i> 退款条例是如何规定的？</span>
                                        <div class="drop-down">
                                            <p>课程安排灵活，课程费用支付提供180天全程准入和资格证书。自定进度课程建议的最后期限，但你不会受到惩罚错过期限，只要你赚你的证书在180天内。以会话为基础的课程可能要求你在截止日期前保持正轨，但如果你落后了，你可以切换到以后的会议，你完成的任何工作将与你转移。</p>
                                        </div>
                                    </li>
                                    <li class="item"><span class="on-off"><i class="i-chevron-bot"></i> 有助学金？</span>
                                        <div class="drop-down">
                                            <p>课程安排灵活，课程费用支付提供180天全程准入和资格证书。自定进度课程建议的最后期限，但你不会受到惩罚错过期限，只要你赚你的证书在180天内。以会话为基础的课程可能要求你在截止日期前保持正轨，但如果你落后了，你可以切换到以后的会议，你完成的任何工作将与你转移。</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="article-right-box">
                    <div class="about-teach">
                        <!--机构信息-->
                        <!--#include virtual="/company/company_info_template.html"-->

                    </div>
                    <div class="learing-box">
                        <div class="tit">看过该课的同学也在看</div>
                        <div class="item-box">
                            <div class="item-list hov" >
                                <div class="infobox">
                                    <div class="morebox" style="background: url(/static/img/widget-titBg.png) no-repeat;">

                                        <p class="top-tit"><a href="">Linux 达人养成记</a></p>
                                        <p class="top-lab">传智播客</p>
                                        <p class="top-num">2589646次播放<span>4.8分</span></p>

                                    </div>
                                    <a>Linux 达人养成记</a>
                                </div>
                            </div>
                            <div class="item-list hov" >
                                <div class="infobox">
                                    <div class="morebox" style="background: url(/static/img/widget-titBg.png) no-repeat;">

                                        <p class="top-tit"><a href="">Redis从入门到精通</a></p>
                                        <p class="top-lab">传智播客</p>
                                        <p class="top-num">2589646次播放<span>4.8分</span></p>

                                    </div>
                                    <a>Redis从入门到精通</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="articleItem" style="display: none">
            <div class="article-cont-catalog">
                <div class="article-left-box">
                    <div class="content">
			<#if (teachplanNode.children)??>
                            <#list teachplanNode.children as firstNode>
                                <div class="item">
                                    <div class="title act"><i class="i-chevron-top"></i>${firstNode.pname}</div>
                                    <div class="about">${firstNode.description!}</div>
                                    <div class="drop-down" style="height: ${firstNode.children?size * 50}px;">
                                        <ul class="list-box">
                                            <#list firstNode.children as secondNode>
                                                <li>${secondNode.pname}</li>
                                            </#list>
                                        </ul>
                                    </div>
                                </div>
                            </#list>
                        </#if>
				<!--
                                <div class="item">
                                    <div class="title act"><i class="i-chevron-top"></i>计算机原理<span class="time">8小时</span></div>
                                    <div class="about"></div>
                                    <div class="drop-down" style="height: 100px;">
                                        <ul class="list-box">
                                                <li>计算机硬件 <span>66’15”</span></li>
                                                <li>计算机软件 <span>66’15”</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="title act"><i class="i-chevron-top"></i>计算机编程入门<span class="time">8小时</span></div>
                                    <div class="about"></div>
                                    <div class="drop-down" style="height: 100px;">
                                        <ul class="list-box">
                                                <li>java语法介绍 <span>66’15”</span></li>
                                                <li>Hello World <span>66’15”</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="title act"><i class="i-chevron-top"></i>数据库编程<span class="time">8小时</span></div>
                                    <div class="about"></div>
                                    <div class="drop-down" style="height: 0px;">
                                        <ul class="list-box">
                                        </ul>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="title act"><i class="i-chevron-top"></i>操作系统原理<span class="time">8小时</span></div>
                                    <div class="about"></div>
                                    <div class="drop-down" style="height: 100px;">
                                        <ul class="list-box">
                                                <li>操作系统原理 <span>66’15”</span></li>
                                                <li>操作系统类型介绍 <span>66’15”</span></li>
                                        </ul>
                                    </div>
                                </div>
				-->
                    </div>
                </div>
                <div class="article-right-box">
                    <div class="about-teach">
                        <!--机构信息-->
                        <!--#include virtual="/company/company_info_template.html"-->
                    </div>
                    <div class="learing-box">
                        <div class="tit">看过该课的同学也在看</div>
                        <div class="item-box">
                            <div class="item-list hov" >
                                <div class="infobox">
                                    <div class="morebox" style="background: url(/static/img/widget-titBg.png) no-repeat;">

                                        <p class="top-tit"><a href="">Linux 达人养成记</a></p>
                                        <p class="top-lab">传智播客</p>
                                        <p class="top-num">2589646次播放<span>4.8分</span></p>

                                    </div>
                                    <a>Linux 达人养成记</a>
                                </div>
                            </div>
                            <div class="item-list hov" >
                                <div class="infobox">
                                    <div class="morebox" style="background: url(/static/img/widget-titBg.png) no-repeat;">

                                        <p class="top-tit"><a href="">Redis从入门到精通</a></p>
                                        <p class="top-lab">传智播客</p>
                                        <p class="top-num">2589646次播放<span>4.8分</span></p>

                                    </div>
                                    <a>Redis从入门到精通</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="artcleAsk" style="display: none">
            <div class="article-cont-ask">
                <div class="article-left-box">
                    <div class="content">
                        <div class="content-title">
                            <p><a class="all">全部</a><a>精选</a><a>我的</a></p>
                            <p><a class="all">全部</a><span><a>1.1</a><a>1.2</a><a>1.3</a><a>1.4</a><a>1.5</a></span><a href="$" class="more">更多 <i class="i-chevron-bot"></i></a></p>
                        </div>
                        <div class="item">
                            <div class="item-left">
                                <p><img src="/static/img/widget-myImg.jpg" width="60px" alt=""></p>
                                <p>毛老师</p>
                            </div>
                            <div class="item-right">
                                <p class="title">如何用微服务重构应用程序?</p>
                                <p><span>我来回答</span></p>
                                <p>2017-3-20 <span><i></i>回答2</span><span><i></i>浏览2</span></p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="item-left">
                                <p><img src="/static/img/widget-myImg.jpg" width="60px" alt=""></p>
                                <p>毛老师</p>
                            </div>
                            <div class="item-right">
                                <p class="title">如何用微服务重构应用程序?</p>
                                <p>在讨论如何将重构转化为微服务之前，退后一步，仔细观察微服务的内容和时间是很重要的。以下两个要点将会对任何微服务重构策略产生重大影响。 【最新 <i class="new">心跳347890</i> 的回答】</p>
                                <p>2017-3-20 <span class="action-box"><span><i class="i-answer"></i>回答 2</span><span><i class="i-browse"></i>浏览 12</span></span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="item-left">
                                <p><img src="/static/img/widget-myImg.jpg" width="60px" alt=""></p>
                                <p>毛老师</p>
                            </div>
                            <div class="item-right">
                                <p class="title">如何用微服务重构应用程序?</p>
                                <p>在讨论如何将重构转化为微服务之前，退后一步，仔细观察微服务的内容和时间是很重要的。以下两个要点将会对任何微服务重构策略产生重大影响。 【最新 <i class="new">心跳347890</i> 的回答】</p>
                                <p>2017-3-20 <span class="action-box"><span><i class="i-answer"></i>回答 2</span><span><i class="i-browse"></i>浏览 12</span></span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="item-left">
                                <p><img src="/static/img/widget-myImg.jpg" width="60px" alt=""></p>
                                <p>毛老师</p>
                            </div>
                            <div class="item-right">
                                <p class="title">如何用微服务重构应用程序?</p>
                                <p>在讨论如何将重构转化为微服务之前，退后一步，仔细观察微服务的内容和时间是很重要的。以下两个要点将会对任何微服务重构策略产生重大影响。 【最新 <i class="new">心跳347890</i> 的回答】</p>
                                <p>2017-3-20 <span class="action-box"><span><i class="i-answer"></i>回答 2</span><span><i class="i-browse"></i>浏览 12</span></span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="item-left">
                                <p><img src="/static/img/widget-myImg.jpg" width="60px" alt=""></p>
                                <p>毛老师</p>
                            </div>
                            <div class="item-right">
                                <p class="title">如何用微服务重构应用程序?</p>
                                <p>在讨论如何将重构转化为微服务之前，退后一步，仔细观察微服务的内容和时间是很重要的。以下两个要点将会对任何微服务重构策略产生重大影响。 【最新 <i class="new">心跳347890</i> 的回答】</p>
                                <p>2017-3-20 <span class="action-box"><span><i class="i-answer"></i>回答 2</span><span><i class="i-browse"></i>浏览 12</span></span>
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="item-left">
                                <p><img src="/static/img/widget-myImg.jpg" width="60px" alt=""></p>
                                <p>毛老师</p>
                            </div>
                            <div class="item-right">
                                <p class="title">如何用微服务重构应用程序?</p>
                                <p>在讨论如何将重构转化为微服务之前，退后一步，仔细观察微服务的内容和时间是很重要的。以下两个要点将会对任何微服务重构策略产生重大影响。 【最新 <i class="new">心跳347890</i> 的回答】</p>
                                <p>2017-3-20 <span class="action-box"><span><i class="i-answer"></i>回答 2</span><span><i class="i-browse"></i>浏览 12</span></span>
                                </p>
                            </div>
                        </div>

                        <div class="itemlast">
                            <a href="#" class="overwrite">显示更多问题</a>
                        </div>
                    </div>
                </div>
                <div class="article-right-box">
                    <div class="about-teach">
                        <div class="teach-info">
                            <!--机构logo-->
                            <img src="/static/img/asset-logo.png" width="40px" alt="">
                            <p>北京传智播客教育集团</p>
                        </div>
                        <div class="teach-info">
                            <ul class="tree-list">
                                <li><p class="item-tt">好评度</p><span class="item-num">  97%  </span></li>
                                <li><p class="item-tt">课程数</p><span class="item-num js-item-num" >234</span></li>
                                <li><p class="item-tt">学生数</p><span class="item-num js-item-num" >78383</span></li>
                            </ul>
                        </div>
                        <div class="teach-info">
                            <p><a href="#" class="courselist_link">TA的课程</a></p>
                        </div>

                        <p class="synopsis">传智播客是一家专门致力于高素质软件开发人才培养的高科技公司。传智播客致力于为企业优选一流的人才的培训理念，以“学员自学入门教程，通过基础考核后进行强化培训”为招生原则，以“针对企业需求，重视基础理论建设，强化高端应用技能”为教学目标，以“高薪保证强大的资深教育团队”为教学后盾，彻底解决所有培训学员的后顾之忧，并解决用人企业难以招聘到合格人才的困扰。</p>
                    </div>
                    <div class="learing-box">
                        <div class="tit">看过该课的同学也在看</div>
                        <div class="item-box">
                            <div class="item-list hov" >
                                <div class="infobox">
                                    <div class="morebox" style="background: url(/static/img/widget-titBg.png) no-repeat;">

                                        <p class="top-tit"><a href="">Linux 达人养成记</a></p>
                                        <p class="top-lab">传智播客</p>
                                        <p class="top-num">2589646次播放<span>4.8分</span></p>

                                    </div>
                                    <a>Linux 达人养成记</a>
                                </div>
                            </div>
                            <div class="item-list hov" >
                                <div class="infobox">
                                    <div class="morebox" style="background: url(/static/img/widget-titBg.png) no-repeat;">

                                        <p class="top-tit"><a href="">Redis从入门到精通</a></p>
                                        <p class="top-lab">传智播客</p>
                                        <p class="top-num">2589646次播放<span>4.8分</span></p>

                                    </div>
                                    <a>Redis从入门到精通</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="artcleCod" style="display: none;">
            <div class="article-cont">
                <div class="article-left-box">
                    <div class="comment-box">
                        <div class="evaluate">
                            <div class="eva-top">
                                <div class="tit">课程评分 </div>
                                <div class="star">
                                    <div class="score"><i>5</i></div>
                                </div><span class="star-score"> <i>5</i> 分</span></div>
                            <div class="eva-cont">
                                <div class="tit">学员评语 </div>
                                <div class="text-box">
                                    <textarea class="form-control" rows="5" placeholder="扯淡、吐槽、表扬、鼓励......想说啥说啥！"></textarea>
                                    <div class="text-right"><span>发表评论</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="course-evaluate">
                            <div class="top-tit">评论
                                    <span>
                        <label><input name="eval" type="radio" value="" checked /> 所有学生 </label>
                        <label><input name="eval" type="radio" value="" /> 完成者 </label>
                    </span>
                            </div>
                            <div class="top-cont">
                                <div class="cont-top-left">
                                    <div class="star-scor">
                                        <div class="star-show">
                                            <div class="score"><i>5</i></div>
                                        </div>
                                        <div class="scor">4.9分</div>
                                    </div>
                                    <div class="all-scor">总评分：12343</div>
                                </div>
                                <div class="cont-top-right">
                                    <div class="star-grade">五星
                                        <div class="grade">
                                            <div class="grade-percent"><span></span></div>
                                            <div class="percent-num"><i>95</i>%</div>
                                        </div>
                                    </div>
                                    <div class="star-grade">四星
                                        <div class="grade">
                                            <div class="grade-percent"><span></span></div>
                                            <div class="percent-num"><i>5</i>%</div>
                                        </div>
                                    </div>
                                    <div class="star-grade">三星
                                        <div class="grade">
                                            <div class="grade-percent"><span></span></div>
                                            <div class="percent-num"><i>0</i>%</div>
                                        </div>
                                    </div>
                                    <div class="star-grade">二星
                                        <div class="grade">
                                            <div class="grade-percent"><span></span></div>
                                            <div class="percent-num"><i>2</i>%</div>
                                        </div>
                                    </div>
                                    <div class="star-grade">一星
                                        <div class="grade">
                                            <div class="grade-percent"><span></span></div>
                                            <div class="percent-num"><i>1</i>%</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="comment-item-box">
                                <div class="title">评论 <span>12453条评论</span></div>
                                <div class="item">
                                    <div class="item-left">
                                        <p><img src="/static/img/widget-pic.png" width="60px" alt=""></p>
                                        <p>毛老师</p>
                                    </div>
                                    <div class="item-cent">
                                        <p>很受用，如果再深入下就更好了。虽然都是入门级别的，但是也很使用，后续就需要自己发挥了！虽然都是入门级别的，但是也很使用，后续就需要自己发挥了！虽然都是入门级别的，但是也很使用，后续就需要自己发挥了！虽然都是入门级别的，但是也很使用，后续就需要自己发挥了！</p>
                                        <p class="time">2017-2-43</p>
                                    </div>
                                    <div class="item-rit">
                                        <p>
                                        <div class="star-show">
                                            <div class="score"><i>4</i></div>
                                        </div>
                                        </p>
                                        <p>评分 <span>5星</span></p>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="item-left">
                                        <p><img src="/static/img/widget-pic.png" width="60px" alt=""></p>
                                        <p>毛老师</p>
                                    </div>
                                    <div class="item-cent">
                                        <p>很受用，如果再深入下就更好了。虽然都是入门级别的，但是也很使用，后续就需要自己发挥了！虽然都是入门级别的，但是也很使用，后续就需要自己发挥了！虽然都是入门级别的，但是也很使用，后续就需要自己发挥了！虽然都是入门级别的，但是也很使用，后续就需要自己发挥了！</p>
                                        <p class="time">2017-2-43</p>
                                    </div>
                                    <div class="item-rit">
                                        <p>
                                        <div class="star-show">
                                            <div class="score"><i>5</i></div>
                                        </div>
                                        </p>
                                        <p>评分 <span>5星</span></p>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="item-left">
                                        <p><img src="/static/img/widget-pic.png" width="60px" alt=""></p>
                                        <p>毛老师</p>
                                    </div>
                                    <div class="item-cent">
                                        <p>很受用，如果再深入下就更好了。虽然都是入门级别的，但是也很使用，后续就需要自己发挥了！虽然都是入门级别的，但是也很使用，后续就需要自己发挥了！虽然都是入门级别的，但是也很使用，后续就需要自己发挥了！虽然都是入门级别的，但是也很使用，后续就需要自己发挥了！</p>
                                        <p class="time">2017-2-43</p>
                                    </div>
                                    <div class="item-rit">
                                        <p>
                                        <div class="star-show">
                                            <div class="score"><i>5</i></div>
                                        </div>
                                        </p>
                                        <p>评分 <span>5星</span></p>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="item-left">
                                        <p><img src="/static/img/widget-pic.png" width="60px" alt=""></p>
                                        <p>毛老师</p>
                                    </div>
                                    <div class="item-cent">
                                        <p>很受用，如果再深入下就更好了。虽然都是入门级别的，但是也很使用，后续就需要自己发挥了！虽然都是入门级别的，但是也很使用，后续就需要自己发挥了！虽然都是入门级别的，但是也很使用，后续就需要自己发挥了！虽然都是入门级别的，但是也很使用，后续就需要自己发挥了！</p>
                                        <p class="time">2017-2-43</p>
                                    </div>
                                    <div class="item-rit">
                                        <p>
                                        <div class="star-show">
                                            <div class="score"><i>5</i></div>
                                        </div>
                                        </p>
                                        <p>评分 <span>5星</span></p>
                                    </div>
                                </div>
                                <div class="get-more">页面加载中...</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="article-right-box">
                    <div class="about-teach">
                        <div class="teach-info">
                            <!--机构logo-->
                            <img src="/static/img/asset-logo.png" width="40px" alt="">
                            <p>北京传智播客教育集团</p>
                        </div>
                        <div class="teach-info">
                            <ul class="tree-list">
                                <li><p class="item-tt">好评度</p><span class="item-num">  97%  </span></li>
                                <li><p class="item-tt">课程数</p><span class="item-num js-item-num" >234</span></li>
                                <li><p class="item-tt">学生数</p><span class="item-num js-item-num" >78383</span></li>
                            </ul>
                        </div>
                        <div class="teach-info">
                            <p><a href="#" class="courselist_link">TA的课程</a></p>
                        </div>

                        <p class="synopsis">传智播客是一家专门致力于高素质软件开发人才培养的高科技公司。传智播客致力于为企业优选一流的人才的培训理念，以“学员自学入门教程，通过基础考核后进行强化培训”为招生原则，以“针对企业需求，重视基础理论建设，强化高端应用技能”为教学目标，以“高薪保证强大的资深教育团队”为教学后盾，彻底解决所有培训学员的后顾之忧，并解决用人企业难以招聘到合格人才的困扰。</p>
                    </div>
                    <div class="learing-box">
                        <div class="tit">看过该课的同学也在看</div>
                        <div class="item-box">
                            <div class="item-list hov" >
                                <div class="infobox">
                                    <div class="morebox" style="background: url(/static/img/widget-titBg.png) no-repeat;">

                                        <p class="top-tit"><a href="">Linux 达人养成记</a></p>
                                        <p class="top-lab">传智播客</p>
                                        <p class="top-num">2589646次播放<span>4.8分</span></p>

                                    </div>
                                    <a>Linux 达人养成记</a>
                                </div>
                            </div>
                            <div class="item-list hov" >
                                <div class="infobox">
                                    <div class="morebox" style="background: url(/static/img/widget-titBg.png) no-repeat;">

                                        <p class="top-tit"><a href="">Redis从入门到精通</a></p>
                                        <p class="top-lab">传智播客</p>
                                        <p class="top-num">2589646次播放<span>4.8分</span></p>

                                    </div>
                                    <a>Redis从入门到精通</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="popup-box" style="display: none">
    <div class="mask"></div>
    <!--欢迎访问课程弹窗- start -->
  <!--  <div class="popup-course-box">
        <div class="title">程序设计语言 <span class="close-popup">×</span></div>
        <div class="content">
            <p>欢迎学习本课程，您现在可以访问课程材料了。</p>
            <p><a href="#">开始学习</a></p>
        </div>
    </div>-->
    <!--欢迎访问课程弹窗- end -->

    <!--支付弹窗- start -->
    <div class="popup-pay-box">
        <div class="title">Bootstrap开发框架 <span class="close-popup">×</span></div>
        <div class="content">
            <img src="./text.png" alt="">
            <div class="info">
                <p class="info-tit">Bootstrap开发框架 <span>课程有效期:2017年9月12日-2018年9月11日</span></p>
                <p class="info-pic">课程价格 : <span>￥98</span></p>
                <p class="info-new-pic">优惠价格 : <span>￥98</span></p>
            </div>
        </div>
       <!-- <div class="fact-pic">实际支付: <span>￥999</span></div>-->
        <div class="go-pay"><a href="#" @click="createOrder" :loading="editLoading"> 确认无误，提交订单</a><!--<a class="addCar" href="">加入购物车</a>--></div>
    </div>
    <!--支付弹窗- end -->
    <div class="popup-comment-box">

    </div>
</div>
<!-- 页面底部 -->
<!--底部版权-->
<!--#include virtual="/include/footer.html"-->

<!--底部版权-->
</div>
<script>var courseId = "${courseBase.id}"</script>
<!--#include virtual="/include/course_detail_dynamic.html"-->
</body>
</html>