# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jobs_info = [["人事专员","一、职位描述
1、主要负责人事招聘，分析、选择、维护各类招聘渠道，并与相关招聘服务机构保持紧密联系，满足公司人才需求；
2、企业文化建设等行政性工作；
3.负责招聘网站的更新、简历筛选、面试预约等工作；
4.负责考勤管理、薪资核算；
5.其他行政管理事务
二、任职要求：
1、要求能熟练使用office、等办公软件，
2、能独立完成各种文章，有语言类专业毕业的或文秘工作经验者优先；
3、需要责任心强、工作细致、性格开朗、善于沟通和团队合作精神"
],[ "销售专员","岗位职责：
1、负责公司产品的销售及推广；
2、根据市场营销计划，完成负责区域销售指标；
3、开拓新市场,发展新客户,增加产品销售范围；
4、负责辖区市场信息的收集及竞争对手的分析；
5、负责销售区域内销售活动的执行，完成销售任务。
任职资格：
1、大专以上学历（含大专）；
2、具有半年以上医疗器械销售、医疗设备销售工作经验者可适当放宽学历要求；
3、正向积极、执行能力强，意见坚韧，适应创业公司节奏，形象气质佳，较好的语言表达能力和沟通能力；
4、能出差，有良好的职业道德和团队合作精神；
5、能熟练掌握办公软件如word、excel、powerpoint等。"
],["JAVA软件工程师","主要职责：
1、具备一定的需求分析和设计能力，以及较强的编码调试能力； 
2、参与软件的设计工作，编制软件总体设计、详细设计等开发文档； 
3、根据设计文档或需求说明完成代码编写，调试，测试和维护； 
4、分析并解决软件开发过程中的问题； 
5、严格按照项目进度完成相关任务目标；
职位要求：
1、计算机相关专业大专以上学历
2、1年以上java代码编写工作经验；
3、熟悉J2EE软件体系架构，熟悉Java语言和面向对象设计方法，并可以熟练使用相关工具；
4、掌握SQLServer、MySQL 、Oracle等至少两种关系型数据库，精通其SQL语法，熟悉数据库性能优化等；
5、掌握并能熟练应用两种以上开发框架，如spring、hibernate、struts等； 
6、能够遵守开发规范；工作主动、积极，责任心强，关注新事物、新技术，有较强的学习能力，喜欢挑战；个性乐观开朗，逻辑性强，有团队合作意识；
7、同时具备前端开发经验或者安卓开发经验者优先。 "
],["业务代表","工作内容：
1，通过终端拜访挖掘新客户，维护老客户；
2，通过展示产品效果向顾客营销我们的产品；
3，需要时刻保持积极的心态，不怕吃苦，并能在打击和困难下成长。
工作标准：
1，年龄28岁以下，活泼健谈，学习能力强，有无经验皆可；
2，积极向上，有较强的语言表达能力，心理素质佳，有一定的抗压能力；
3，在公司希望提高自己的管理能力者，敢想敢拼，有上进心；
4，欢迎应届毕业生的加盟，更大的普升级至，与公司共同发展。
薪资待遇：
1、底薪3500-4500元+提成+奖金+福利；
2、免费提供住宿，免费培训；
3、带薪年假，每年2-3次公费旅游；
4、有国内学习进修出差机会。、
5、转正后投五险一金，国家法定节假日休息"
],["财务专员","岗位职责：
1、准备和报送会计报表，协助办理税务报表的申报；
2、现金及银行收付处理，制作记帐凭证，银行对帐，单据审核，开具与保管发票；
3、协助财会文件的准备、归档和保管；
5、负责与银行、税务等部门的对外联络；
6、协助主管完成其他日常事务性工作。
任职资格：
1、财务，会计，经济等相关专业大专以上学历，具有会计任职资格；
2、熟悉现金管理和银行结算，熟悉用友或其他财务软件的操作；
3、具有较强的独立学习和工作的能力，工作踏实，认真细心，积极主动；
4、具有良好的职业操守及团队合作精神，较强的沟通、理解和分析能力。"
]]

puts "这个种子档会自动建立一个admin账号和一个用户账号, 并且创建30个public jobs, 以及30个hidden jobs"

create_account = User.create([email: "admin@gmail.com", password:"12345678",password_confirmation: "12345678",is_admin:"true"])

puts "Admin account created."

create_account_user = User.create([email: "aaa@aaa.com", password:"12345678",password_confirmation: "12345678",is_admin:"false"])

puts "User account created."

create_jobs = for i in 1..30 do
 job_test=jobs_info[rand(0..4)]
 Job.create!([title: job_test[0],description: job_test[1], wage_upper_bound: rand(50..99)*100,
   wage_lower_bound: rand(10..49)*100, is_hidden:"false"])
end

puts "30 Public jobs created."

create_jobs = for i in 1..30 do
 job_test=jobs_info[rand(0..4)]
 Job.create!([title: job_test[0],description: job_test[1], wage_upper_bound: rand(50..99)*100,
   wage_lower_bound: rand(10..49)*100, is_hidden:"true"])
end

puts "30 Hidden jobs created."
