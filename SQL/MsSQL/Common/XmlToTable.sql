----- url: https://sqlwithmanoj.com/2011/01/28/select-an-xml-to-table/

DECLARE @xml XML
SET @xml = N'
<LocalSettings>
	<Plants>
		<Plant Number = ''0901'' Name = ''0901 - FES'' Enabled = ''0'' />
		<Plant Number = ''1201'' Name = ''1201 - SIN'' Enabled = ''0'' />
		<Plant Number = ''1301'' Name = ''1301 - TWN'' Enabled = ''0'' />
		<Plant Number = ''1401'' Name = ''1401 - MAL'' Enabled = ''0'' />
		<Plant Number = ''1501'' Name = ''1501 - THAI'' Enabled = ''0'' />
		<Plant Number = ''1701'' Name = ''1701 - DG'' Enabled = ''0'' />
		<Plant Number = ''2101'' Name = ''2101 - AFLEX'' Enabled = ''0'' />
		<Plant Number = ''2301'' Name = ''2301 - ZJ'' Enabled = ''0'' />
		<Plant Number = ''2401'' Name = ''2401 - HK'' Enabled = ''0'' />
		<Plant Number = ''2601'' Name = ''2601 - SHA'' Enabled = ''0'' />
		<Plant Number = ''2701'' Name = ''2701 - CD'' Enabled = ''1'' />
		<Plant Number = ''2801'' Name = ''2801 - CTC'' Enabled = ''0'' />
		<Plant Number = ''2802'' Name = ''2802 - SZ'' Enabled = ''0'' />
		<Plant Number = ''2901'' Name = ''2901 - PHIL'' Enabled = ''0'' />
		<Plant Number = ''6201'' Name = ''6201 - SHN'' Enabled = ''0'' />
		<Plant Number = ''8201'' Name = ''8201 - IND'' Enabled = ''0'' />
		<Plant Number = ''8301'' Name = ''8301 - IND'' Enabled = ''0'' />
	</Plants>
	<ApproverLabels>
		<ApproverLabel Plant = ''2701'' RelatedDeptEnabled = "1" Approver1Label = "Related Department Manager" Approver2Label = "Department Manager" Approver3Label = "WH Admin"/>
		<ApproverLabel Plant = ''2701'' RelatedDeptEnabled = "0" Approver1Label = "Department Pre-Approver" Approver2Label = "Department Manager" Approver3Label = "WH Admin"/>
	</ApproverLabels>
	<Departments>
		<Department Plant = ''2701'' Name = ''Ass_ENGR - 装配工程部(电控)'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Huang Heng'' 		Approver1ID = ''MOLEX\hhuang03'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Chen QunDong'' Approver2ID = ''MOLEXqdchen01'' />
		<Department Plant = ''2701'' Name = ''Ass_ENGR - 装配工程部CBU/EBU'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Ma ZhiQiang'' 		Approver1ID = ''MOLEX\zqma'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Chen QunDong'' Approver2ID = ''MOLEXqdchen01'' />
		<Department Plant = ''2701'' Name = ''Ass_ENGR - 装配工程部TBU'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Lv Fang'' 		Approver1ID = ''MOLEX\flv02'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Chen QunDong'' Approver2ID = ''MOLEXqdchen01'' />
		<Department Plant = ''2701'' Name = ''Assembly - 装配部-CBU'' 				Approver1Enabled = ''Yes'' Approver1Name = '''' 			Approver1ID = ''MOLEX\'' 		Approver2Enabled = ''Yes'' Approver2Name = ''Winson Li'' 	Approver2ID = ''MOLEXwli23'' />
		<Department Plant = ''2701'' Name = ''Assembly - 装配部-EBU'' 				Approver1Enabled = ''Yes'' Approver1Name = '''' 			Approver1ID = ''MOLEX\'' 		Approver2Enabled = ''Yes'' Approver2Name = ''Winson Li'' 	Approver2ID = ''MOLEXwli23'' />
		<Department Plant = ''2701'' Name = ''Assembly - 装配部-IBU'' 				Approver1Enabled = ''Yes'' Approver1Name = '''' 			Approver1ID = ''MOLEX\'' 		Approver2Enabled = ''Yes'' Approver2Name = ''Winson Li'' 	Approver2ID = ''MOLEXwli23'' />
		<Department Plant = ''2701'' Name = ''Assembly - 装配部-SSL'' 				Approver1Enabled = ''Yes'' Approver1Name = '''' 			Approver1ID = ''MOLEX\'' 		Approver2Enabled = ''Yes'' Approver2Name = ''Winson Li'' 	Approver2ID = ''MOLEXwli23'' />
		<Department Plant = ''2701'' Name = ''Assembly - 装配部-TBU'' 				Approver1Enabled = ''Yes'' Approver1Name = '''' 			Approver1ID = ''MOLEX\'' 		Approver2Enabled = ''Yes'' Approver2Name = ''Winson Li'' 	Approver2ID = ''MOLEXwli23'' />
		<Department Plant = ''2701'' Name = ''In_Molding - 嵌入式注塑部'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Steven Wang'' 		Approver1ID = ''MOLEX\ymwang'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Steven Wang'' 	Approver2ID = ''MOLEXymwang'' />
		<Department Plant = ''2701'' Name = ''Molding - 注塑部'' 				Approver1Enabled = ''Yes'' Approver1Name = ''Shi Feng'' 		Approver1ID = ''MOLEX\fshi02'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Shi Feng'' 	Approver2ID = ''MOLEXfshi02'' />
		<Department Plant = ''2701'' Name = ''NonOp_FIN - 财务部'' 				Approver1Enabled = ''Yes'' Approver1Name = ''Sally Gong'' 		Approver1ID = ''MOLEX\mgong02'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Sally Gong'' 	Approver2ID = ''MOLEXmgong02'' />
		<Department Plant = ''2701'' Name = ''NonOp_HR - 人力资源部(C&amp;B)'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Ana Ma'' 		Approver1ID = ''MOLEX\ama'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Jane Zhang'' 	Approver2ID = ''MOLEXjwzhang'' />
		<Department Plant = ''2701'' Name = ''NonOp_HR - 人力资源部(Recruit)'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Tina Tang'' 		Approver1ID = ''MOLEX\ttang'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Jane Zhang'' 	Approver2ID = ''MOLEXjwzhang'' />
		<Department Plant = ''2701'' Name = ''NonOp_HR - 人力资源部(T&amp;D)'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Rachel Huang''	 	Approver1ID = ''MOLEX\phuang'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Jane Zhang'' 	Approver2ID = ''MOLEXjwzhang'' />
		<Department Plant = ''2701'' Name = ''NonOp_ITC - ITC'' 				Approver1Enabled = ''Yes'' Approver1Name = ''Johnson Xie'' 		Approver1ID = ''MOLEX\jxie03'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Michael Lam'' 	Approver2ID = ''MOLEXmlam'' />
		<Department Plant = ''2701'' Name = ''NonOp_Mark - 产品管理及市场发展部'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Donne Liu'' 		Approver1ID = ''MOLEX\dliu18'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Donne Liu'' 	Approver2ID = ''MOLEXdliu18'' />
		<Department Plant = ''2701'' Name = ''NonOp_Mate - 物料部-CSR'' 			Approver1Enabled = ''Yes'' Approver1Name = '''' 			Approver1ID = ''MOLEX\'' 		Approver2Enabled = ''Yes'' Approver2Name = ''Winson Li'' 	Approver2ID = ''MOLEXwli23'' />
		<Department Plant = ''2701'' Name = ''NonOp_Mate - 物料部-Planing'' 			Approver1Enabled = ''Yes'' Approver1Name = '''' 			Approver1ID = ''MOLEX\'' 		Approver2Enabled = ''Yes'' Approver2Name = ''Winson Li'' 	Approver2ID = ''MOLEXwli23'' />
		<Department Plant = ''2701'' Name = ''NonOp_Mate - 物料部-purchasing'' 		Approver1Enabled = ''Yes'' Approver1Name = ''Windy Zhang'' 		Approver1ID = ''MOLEX\wzhang01'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Windy Zhang'' 	Approver2ID = ''MOLEXwzhang01'' />
		<Department Plant = ''2701'' Name = ''NonOp_Mate - 物料部-sourcing'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Windy Zhang'' 		Approver1ID = ''MOLEX\wzhang01'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Windy Zhang'' 	Approver2ID = ''MOLEXwzhang01'' />
		<Department Plant = ''2701'' Name = ''NonOp_Mfg - 制造服务部-Admin'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Liu Jing'' 		Approver1ID = ''MOLEX\jliu37'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Michael Lam'' 	Approver2ID = ''MOLEXmlam'' />
		<Department Plant = ''2701'' Name = ''NonOp_Mfg - 制造服务部-EHS'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Li Tao'' 		Approver1ID = ''MOLEX\tli38'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Michael Lam'' 	Approver2ID = ''MOLEXmlam'' />
		<Department Plant = ''2701'' Name = ''NonOp_Mfg - 制造服务部-FAC'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Baker Peng'' 		Approver1ID = ''MOLEX\ygpeng'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Michael Lam'' 	Approver2ID = ''MOLEXmlam'' />
		<Department Plant = ''2701'' Name = ''NonOp_Mfg - 制造服务部-IE'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Allun Huang'' 		Approver1ID = ''MOLEX\ahuang'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Michael Lam'' 	Approver2ID = ''MOLEXmlam'' />
		<Department Plant = ''2701'' Name = ''NonOp_Mfg - 制造服务部-LOG'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Jacky Huang'' 		Approver1ID = ''MOLEX\ashuang'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Michael Lam'' 	Approver2ID = ''MOLEXmlam'' />
		<Department Plant = ''2701'' Name = ''NonOp_Mfg - 制造服务部-WH'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Johnson Xie'' 		Approver1ID = ''MOLEX\jxie03'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Michael Lam'' 	Approver2ID = ''MOLEXmlam'' />
		<Department Plant = ''2701'' Name = ''NonOp_MIS - 电脑部'' 				Approver1Enabled = ''Yes'' Approver1Name = ''Scott Huang'' 		Approver1ID = ''MOLEX\yhuang09'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Scott Huang'' 	Approver2ID = ''MOLEXyhuang09'' />
		<Department Plant = ''2701'' Name = ''NonOp_PrdD - 产品研发部/ 实验室'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Aaron Qiu'' 		Approver1ID = ''MOLEX\cbqiu'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Donne Liu'' 	Approver2ID = ''MOLEXdliu18'' />
		<Department Plant = ''2701'' Name = ''NonOp_PrjM - Auto项目管理'' 			Approver1Enabled = ''Yes'' Approver1Name = ''George Zhang'' 	Approver1ID = ''MOLEX\gzhang06'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Donne Liu'' 	Approver2ID = ''MOLEXdliu18'' />
		<Department Plant = ''2701'' Name = ''NonOp_Pro - 产品成本部'' 				Approver1Enabled = ''Yes'' Approver1Name = ''Sally Gong'' 		Approver1ID = ''MOLEX\mgong02'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Sally Gong'' 	Approver2ID = ''MOLEXmgong02'' />
		<Department Plant = ''2701'' Name = ''NonOp_QA - 质量部-CBU Assembly'' 		Approver1Enabled = ''Yes'' Approver1Name = ''Jiang Ping'' 		Approver1ID = ''MOLEX\pjiang'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Guo xi'' 	Approver2ID = ''MOLEXxguo07'' />
		<Department Plant = ''2701'' Name = ''NonOp_QA - 质量部-CBU/EBU New Products'' 	Approver1Enabled = ''Yes'' Approver1Name = ''yang youhui'' 		Approver1ID = ''MOLEX\yhyang'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Guo xi'' 	Approver2ID = ''MOLEXxguo07'' />
		<Department Plant = ''2701'' Name = ''NonOp_QA - 质量部-Components'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Wu May'' 		Approver1ID = ''MOLEX\mwu01'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Guo xi'' 	Approver2ID = ''MOLEXxguo07'' />
		<Department Plant = ''2701'' Name = ''NonOp_QA - 质量部-ICM Assembly'' 		Approver1Enabled = ''Yes'' Approver1Name = ''Elvis Du'' 		Approver1ID = ''MOLEX\edu'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Guo xi'' 	Approver2ID = ''MOLEXxguo07'' />
		<Department Plant = ''2701'' Name = ''NonOp_QA - 质量部-SQA &amp; Incoming Mtl.'' 	Approver1Enabled = ''Yes'' Approver1Name = ''Sun Simon'' 		Approver1ID = ''MOLEX\zgsun'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Guo xi'' 	Approver2ID = ''MOLEXxguo07'' />
		<Department Plant = ''2701'' Name = ''NonOp_QA - 质量部-TBU Assyembly'' 		Approver1Enabled = ''Yes'' Approver1Name = ''Luo Xiao'' 		Approver1ID = ''MOLEX\xluo02'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Guo xi'' 	Approver2ID = ''MOLEXxguo07'' />
		<Department Plant = ''2701'' Name = ''NonOp_QA - 质量部-TBU New Products'' 		Approver1Enabled = ''Yes'' Approver1Name = ''Liang Yuan'' 		Approver1ID = ''MOLEX\yliang'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Guo xi'' 	Approver2ID = ''MOLEXxguo07'' />
		<Department Plant = ''2701'' Name = ''Op_Exc - 卓越运营部'' 				Approver1Enabled = ''Yes'' Approver1Name = ''Yang DengKe'' 		Approver1ID = ''MOLEX\dkyang'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Yang DengKe'' 	Approver2ID = ''MOLEXdkyang'' />
		<Department Plant = ''2701'' Name = ''Plating - 电镀部'' 				Approver1Enabled = ''Yes'' Approver1Name = ''Miao YuanGang'' 	Approver1ID = ''MOLEX\ygmiao'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Miao YuanGang'' Approver2ID = ''MOLEXygmiao'' />
		<Department Plant = ''2701'' Name = ''Product_Dv - 产品发展部'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Oldking Zou'' 		Approver1ID = ''MOLEX\fxzou'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Oldking Zou'' 	Approver2ID = ''MOLEXfxzou'' />
		<Department Plant = ''2701'' Name = ''Stamping - 冲压部'' 				Approver1Enabled = ''Yes'' Approver1Name = ''Ran CongWei'' 		Approver1ID = ''MOLEX\cwran'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Yao limin'' 	Approver2ID = ''MOLEXlmyao'' />
		<Department Plant = ''2701'' Name = ''TC - 模具中心- Die Engineering'' 		Approver1Enabled = ''Yes'' Approver1Name = ''Alan Luo'' 		Approver1ID = ''MOLEX\aluo'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Vincent Yap'' 	Approver2ID = ''MOLEXytyap'' />
		<Department Plant = ''2701'' Name = ''TC - 模具中心- Fabrication '' 			Approver1Enabled = ''Yes'' Approver1Name = ''Yu JG'' 		Approver1ID = ''MOLEX\jgyu'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Wang Yong'' 	Approver2ID = ''MOLEXywang05'' />
		<Department Plant = ''2701'' Name = ''TC - 模具中心- Heat Treatment'' 			Approver1Enabled = ''Yes'' Approver1Name = ''Zhang FB'' 		Approver1ID = ''MOLEX\fbzhang'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Wang Yong'' 	Approver2ID = ''MOLEXywang05'' />
		<Department Plant = ''2701'' Name = ''TC - 模具中心- Mold Engineering'' 		Approver1Enabled = ''Yes'' Approver1Name = ''Fu Jianlin'' 		Approver1ID = ''MOLEX\jlfu'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Vincent Yap'' 	Approver2ID = ''MOLEXytyap'' />
		<Department Plant = ''2701'' Name = ''TC - 模具中心- Project management -Die'' 	Approver1Enabled = ''Yes'' Approver1Name = ''Very Tan'' 		Approver1ID = ''MOLEX\vtan'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Vincent Yap'' 	Approver2ID = ''MOLEXytyap'' />
		<Department Plant = ''2701'' Name = ''TC - 模具中心- Project management -Mold'' 	Approver1Enabled = ''Yes'' Approver1Name = ''Alan Li'' 		Approver1ID = ''MOLEX\cyli02'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Vincent Yap'' 	Approver2ID = ''MOLEXytyap'' />
		<Department Plant = ''2701'' Name = ''TC - 模具中心- QA'' 				Approver1Enabled = ''Yes'' Approver1Name = ''Hu Jun'' 		Approver1ID = ''MOLEX\jhu09'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Vincent Yap'' 	Approver2ID = ''MOLEXytyap'' />
		<Department Plant = ''2701'' Name = ''TC - 模具中心- Technical Support'' 		Approver1Enabled = ''Yes'' Approver1Name = ''Rodger Li'' 		Approver1ID = ''MOLEX\zpli'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Wang Yong'' 	Approver2ID = ''MOLEXywang05'' />
		<Department Plant = ''2701'' Name = ''TC - 模具中心- Tooling Control '' 		Approver1Enabled = ''Yes'' Approver1Name = ''Scot Chen'' 		Approver1ID = ''MOLEX\schen09'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Wang Yong'' 	Approver2ID = ''MOLEXywang05'' />
		<Department Plant = ''2701'' Name = ''Tooling_Dv - 模具开发'' 				Approver1Enabled = ''Yes'' Approver1Name = ''Vigor Huang'' 		Approver1ID = ''MOLEX\vhuang01'' 	Approver2Enabled = ''Yes'' Approver2Name = ''Vigor Huang'' 	Approver2ID = ''MOLEXvhuang01'' />
	</Departments>
	<RelatedDepartments>
		<RelatedDepartment Plant = ''2701'' Name = ''Facility Related'' ApproverName = ''Baker Peng'' ApproverID = ''MOLEX\ygpeng''/>
		<RelatedDepartment Plant = ''2701'' Name = ''HR Related'' ApproverName = ''Jane Zhang'' ApproverID = ''MOLEX\jwzhang''/>
		<RelatedDepartment Plant = ''2701'' Name = ''MIS Related'' ApproverName = ''Scott Huang'' ApproverID = ''MOLEX\yhuang09''/>
	</RelatedDepartments>
	<WHAdmins>
		<WHAdmin Plant = ''2701'' Name = '''' ID =''''/>
	</WHAdmins>
	<DBErrorOwner>
		<Owner ID = "MOLEX\zdli02"/>
	</DBErrorOwner>
</LocalSettings>
'
 
SELECT
Tab.Col.value('@Number','varchar(50)') AS Plant,
Tab.Col.value('@Name','varchar(50)') AS PlantName,
Tab.Col.value('@Enabled','int') AS isEnable
FROM   @xml.nodes('/LocalSettings/Plants/Plant') Tab(Col)

SELECT
Tab.Col.value('@Plant','varchar(50)') AS Plant,
Tab.Col.value('@Name','varchar(50)') AS DepartmentName,
Tab.Col.value('@Approver1ID','varchar(50)') AS Approver1ID,
Tab.Col.value('@Approver1Name','varchar(50)') AS Approver1Name,
Tab.Col.value('@Approver1Enabled','varchar(50)') AS Approver1Enabled,
Tab.Col.value('@Approver2ID','varchar(50)') AS Approver2ID,
Tab.Col.value('@Approver2Name','varchar(50)') AS Approver2Name,
Tab.Col.value('@Approver2Enabled','varchar(50)') AS Approver2Enabled
FROM   @xml.nodes('/LocalSettings/Departments/Department') Tab(Col)
--GO

-- method two:
DECLARE @docHandle int
-- Create internal representation of the XML document and return the xml-doc Handle ID
--EXEC sp_xml_preparedocument @docHandle OUTPUT, @xml
 set @docHandle = 5
--select @docHandle -- 37
 
SELECT *
FROM OPENXML(@docHandle, N'//LocalSettings/Plants/Plant')
WITH (Number varchar(50), Name VARCHAR(50), Enabled VARCHAR(20))