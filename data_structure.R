#######################################
###professor Choi, shizu@snu.ac.kr ####
#######################################




#######################################
########   R ������ ����    ###########
#######################################

#scalar#vector#list#array#data.frame#c#rbind#cbind#$#mean#na.rm=TRUE




#ctrl+enter ������ console â�� ���, ������ �����ؼ� run�� ����
#�Լ��� yellow�� ǥ��, ��ȣ �ȿ� �Լ��� ���� ���� ����
#comment�� ������ �տ� #�� ����
print("Hello world!")
#��� ��� ����
1*2
3*4
2/4

#����(variable) �����
#������ ��ü, �������� ������ ������ (������ �����ϼ���)
a<-2
a
a<-3
a
#concatenate�� ���� c, ������ �ǹ�
a<-c(3,5)
a

##R���� ���̴� ���� ����
#numeric (real or decimal): 2, 2.0, pi
#character : "a", "work"
#complex : 1+4i
#logical : true of false
#integer : special case of numeric dat without decimals 

#scalar, vector, array, list, dataframe�� ����
#scalar: �ϳ��� ����(element)
scalar<-1
scalar
scalar<-"bts"
scalar

#vector : �������� ���ҵ��̳� �ϳ��� row
vector <-c(1,2,3)
vector
vector <-c("v", "rm", "suga")
vector

#matrix : 2*2, 2*3�� ��� (vector�� �������� row�� ��������)
matrix <-matrix(c(1,2,3,4,5,6), nrow=3)
matrix
matrix <-matrix(c(1,2,3,4,5,6), nrow=2)
matrix
matrix <-matrix(c(1,2,3,4,5,6), nrow=2, byrow=TRUE)
matrix
matrix <-matrix(c(1:20), nrow=4, ncol=5)
matrix
mat1 <-c(1:3)
mat2 <-c(4:6)
matrix<-c(mat1, mat2)
matrix
matrix <-cbind(mat1, mat2)  #cbind : column�� �������� Ⱦ���� ���̱�
matrix
matrix <-rbind(mat1, mat2)  #rbind : row�� �������� ������ ���̱�
matrix
#Ư�� ��ġ�� ��� ���� �� ġȯ
matrix[1,2]
matrix[1:2]
matrix[1,] #ù��° row�� ��� ���Ҹ� ����
matrix[,1] #ù��° col�� ��� ���Ҹ� ����
matrix[c(1,2),] #1,2��° row�� ��� ���Ҹ� ����
matrix[1,2]=100
matrix

#array : matrix�� ���������� ������
matrix1<- matrix(c(1:9), nrow=3)
matrix1
matrix2<- matrix(c(10:18), nrow=3)
matrix3<- matrix(c(19:27), nrow=3)
matrix2
matrix3
array <-array(c(matrix1, matrix2, matrix3), dim=c(3,3,3))
array

#���ݱ��� ���캻 vector, matrix, array�� ��� ���� Ư���� �����ͷθ� �����Ǿ� ����. �� character, logic, numeric�� ������
#�Ϲ������� ���� �����ʹ� ���ں���, ���ں��� ���� �ϳ��� �����ͼ¿� �������. �� ��� ���� ���� dataframe. ������ �츮�� ���� ��κ��� �����ʹ� dataframe�� ����



btsname <-c("RM", "Jin", "suga","jhope", "jimin", "V", "JK")
btsyear <-c(1994, 1992, 1993, 1994, 1995, 1995, 1997)
btsposition <-c("rap", "vocal", "rap", "rap", "vocal", "vocal","vocal")
bts <-data.frame(btsname, btsyear, btsposition)
bts   
str(bts)

bts <-data.frame(btsname, btsyear, btsposition, stringsAsFactors = TRUE)
str(bts)

#factor�� ����
#factor�� �ַ� categorical�� �����μ� "��"(�Ϲݺ���)�� "level"�̶�� ������ �߰��� ��
gender=factor(c("male", "female", "female", "male"))
gender
str(gender)


##level�� ������ �ٲٰ� �Ͱų�, referece group ������ ���ؼ��� leves=c() ���
gender=factor(gender, 
              levels=c("male", "female"))
gender
str(gender)

#dataframe Ȱ��
#���� ���� $ǥ�� Ȱ��
bts$btsname
bts$btsposition
bts$btsposition=factor(btsposition, levels=c("vocal", "rap"))
bts$btsposition
bts$age <- 2021-bts$btsyear+1
bts
bts$null <-NULL
bts
bts$na <-NA
bts
dim(bts)
#na=not available�� ����. ����ġ�� �ǹ���
#NULL=�������� �ʴ� ��
#na�� null�� ���̴� mean ����� Ȯ�� ����
#null�� �ڵ����� ���õǾ� mean ����
#na�� ��տ� ������ ��ħ. ���� na.rm=TRUE �ɼ��� ���� na�� �����ϰ� ����� ���� �� ����

bts
bts[1,5]<-3
bts[2,5]<-5
bts[3,5]<-1
mean(bts$na)

bts[1,4]<-NA    #���ȣ�� indexing, [row, column] ������ �������
mean(bts$age)
mean(bts$age, na.rm=TRUE)
bts


#�۾� ���丮 �����ϱ� -> r project�� �����ʰ� script�� ���� ��������� ���
getwd()
setwd("C:\\Users\\Owner\\Documents\\new") ##�ڷ� ���� directory ����


#package �ҷ�����(install)�� ����(library)
install.packages("readxl")
install.packages("foreign")
library(readxl)
library(foreign)

#�ڷ� �Է� �� ���
#�ܺ��ڷ� ��������. excel�� csv ���Ϸ� �������� ��õ
data_csv <- read.table("data_csv.csv", header = T, sep=",") 
data_spss <- read.spss("data_sav.sav", use.value.labels=T, to.data.frame=T)
#�ܺ��ڷ� ��������. excel�� csv ���Ϸ� �������� ��õ
write.table(data_csv, "data_csv2.csv", sep=",", row.names = F, quote=F)
write.foreign(data_spss, "data_spss2.dat", "data_spss2.sav", package="SPSS")

#������� (summary)
View(data_csv)
str(data_csv)
#score2�� character�����̹Ƿ� numeric���� ����
data_csv$score2 <- as.numeric(data_csv$score2)
#��ǥ������ missing�� ����°� Ȯ���߽��ϴ�. gsub �Լ��� Ȱ���� ��ǥ�� ���ְڽ��ϴ�
#gsub(�������� ���롰, �����Ź�ġ�, ��ü$����)
data_csv$score2 <- gsub(",", "", data_csv$score2)
data_csv$score2 <- as.numeric(data_csv$score2)
#edu�� employment�� factor�� ��ȯ�ϰڽ��ϴ�
data_csv$edu=factor(data_csv$edu, 
                    levels=c("elementry", "middle", "high"))
data_csv$employment=factor(data_csv$employment, 
                           levels=c("employed", "unemployed"))

summary(data_csv)
summary(data_csv$score)


table(data_csv$edu)
addmargins(table(data_csv$edu))

table(data_csv$edu, data_csv$employment)
addmargins(table(data_csv$edu, data_csv$employment))