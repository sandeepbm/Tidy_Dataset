######Below procedure was used to create tidy dataset:
1. Set directory UCI HAR Dataset
2. Read activity_labels.txt into table T1
	1. Set column names as "Activity" and "Activity Name"
3. Read features.txt into table T2
4. Set directory test
5. Read subject_test.txt into dataset D1
	1. Set column name "Subject"
6. Read X_test.txt into dataset D2
	1. Select column 2 of table T2 as vector V1
	2. Append each value of V1 with "Test" to give V2
	3. Set column names of D2 to V2
	4. Extract only column names that have "mean()" to get dataset D2_E1
	5. Extract only column names that have "std()" to get dataset D2_E2
7. Read y_test.txt into dataset D3
	1. Set column name "Activity"
	2. Merge with T1 to get D3_E1
	3. Select only "Activity Name" column from D3_E1 to give D3_E2
8. Combine D1, D2_E1, D2_E2, D3_E2 by columns to give dataset DTest
9. Set directory train
10. Read subject_train.txt into dataset D4
	1. Set column name "Subject"
11) Read X_train.txt into dataset D5
	1. Select column 2 of table T2 as vector V1
	2. Append each value of V1 with "Train" to give V2
	3. Set column names of D2 to V2
	4. Extract only column names that have "mean()" or "std()" to get dataset D5_E1
	5. Extract only column names that have "std()" to get dataset D5_E2
12. Read y_train.txt into dataset D6
	1. Set column name "Activity"
	2. Merge with T1 to get D6_E1
	3. Select only "Activity Name" column from D6_E1 to give D6_E2
13. Combine D4, D5_E1, D5_E2, D6_E2 by columns to give dataset DTrain
14. Merge Dtest, Dtrain by Subject and Activity columns to give dataset D_ALL
17. On D_ALL, group by Subject and Activity Name and summarise each column by mean function to give D_Final
18. Write DFinal to text file Tidy dataset.txt in the original directory