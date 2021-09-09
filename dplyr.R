#######################################
###professor Choi, shizu@snu.ac.kr ####
#######################################




#######################################
########dplyr(������ ��ó��)###########
#######################################


#scalr#vector#list#array#data.frame#c#rbind#cbind#$

installpackages()
install.packages("dplyr")
library(dplyr)

### 1.dplyr�Ұ�   ##############################################################
##�ַ� ������ ��ó�� �������� ���� ���
##������ ��ó���� ������ �м� ������ ���� �����͸� �籸��ȭ, 
#���͸�(Ư�� �������� ���� �����͸� ����), Ư�������� �����ϰų�(select),
#����(ordering), ���ο� ������ �����(mutate, trasformate)���� ���� �۾���

### 2.chain operator, %>%  #####################################################
##dplyr�� ������ chain operator�� ����Ͽ� �ڵ带 �����ϰ� ©�� �ִٴ� ��
##chain operatr�� "and then"�� ������ ���� �ǹ̷� ���. ������ ��ȣ()�� �� ��ɼ���
##�������� �ڵ��� �����ϰ� �ϸ�, �Ұ�ȣ ���� �Ǽ��� ���� �� ����
##�����: ctrl+shif+M 

##chain oeprator �̻���
x<-c(30, 20, 10, 0)
sqrt(mean(abs(x)))
##chain oeprator ���� (X�� �������� and then, absolute value���� and then~~~)
x %>% 
  abs() %>%
  mean() %>%
  sqrt()

#Ư���Լ��� ���� ���� ����
help(abs)

## ������ ���� ó�� �Լ�
# abs(x) : ���밪
# sqrt(x) : ������
# ceiling(x) : x���� ũ�ų� ���� ����
# floor(x) : x���� �ۼ��� ���� ����
# truc(x) : �Ҽ��� ���� ����
# round(x, digits=n) : �Ҽ��� n�ڸ��� �ݿø�
# log(s, base=n) :���� n�� log 
# exp(x) : ���� ��ȯ
# factorial(x) : factorial(3! = 3*2*1)


### 3.dplyr�� �ֿ� ���  #######################################################
### 3.1.filter           #######################################################
##filter�� Ư�� ������ Ư������ ������(��: ����=����) ��(row)�� �����ϴ� ���
##�� dataset�� Ⱦ���� �����ϴ� ���


##�м��� �ռ��� R ���� �����͸� �ҷ�����
install.packages("nycflights13")
library(nycflights13)
head(flights) # head �ڷ� ������ ������
flight_df <-data.frame(flights) #data frame���� ��ȯ
#�����ϱ� ���� �����ͱ��� �ľ� �ʼ�! : �����Ͱ� 336776��, 19���� ������ �ִ� ����� �⵵�� ����
str(flight_df)
##month=2�� �ڷḸ subset
flight_df %>% 
  filter(month==2) %>%
  count(month)##�����Ͱ� �ʹ� ��ϱ� �տ� 5���� print

flight_df %>% 
  filter(month==2) %>%
  count(month)##month �ڷḸ �����μ� filtering ���θ� Ȯ��


##month=2 or day=1  �ڷḸ subset
flight_df %>% 
  filter(month==2 | day==1) %>% #shift+\
  head(5)

##month=2 and day=1  �ڷḸ subset
flight_df %>% 
  filter(month==2, day==1) %>%  #��ǥ�� & ��� ��� ����
  
  ##month=2�� �ƴ� �ڷḸ subset
  flight_df %>% 
  filter(month!=2) %>%  #����ǥ�� not�� �ǹ�(!+=), ��ȣ�� �ѹ��� ���°��� ����
  
  ##month�� 5�̻��� �ڷḸ subset
  flight_df %>% 
  filter(month >=5) %>%  #  >+=
  
  ##month�� 5, 7, 10�� �ڷḸ(������ ����) subset
  flight_df %>% 
  filter(month %in% c(5,7,10))

##na �� ǥ�� �Ǵ� ���� �ؼ� subset
flight_df %>% 
  filter(is.na(month)) #na�� row�� ǥ��

flight_df %>% 
  filter(!is.na(month)) #na�� �ƴ� row�� ǥ��

##������ ����: dplyr�� ��κ��� ���ɾ�� row data�� �������� ����. ���� ������ ������ ������ �����ϴ� ������ �ʿ�

filter_flight_df <-
  flight_df %>% 
  filter(month %in% c(5,7,10)) ##filter_flight_df(no of cases 87110���� ���� ���� Ȯ��)

### 3.2.select #######################################################
##select�� Ư�� ������ �����ϴ� ���(��(colomn) ����)
##�� dataset�� ������ �����ϴ� ���

##month, day ������ �����ؼ� ����
select_flight_df<-
  flight_df %>%
  select(month, day) %>% 
  str(select_flight_df)
##year���� day������ ������ �����ؼ� ���� (���Ӻ��� ����)
select_flight_df<-
  flight_df %>%
  select(year:day) %>% 
  str(select_flight_df)

##year���� day������ ������ �����ؼ� �����ؼ� ���� 
select_flight_df<-
  flight_df %>%
  select(! year:day) #year~day ���� ���� �����ϰ� ����

select_flight_df<-
  flight_df %>%
  select(-c(year, month)) #year, month ���� �����ϰ� ����


### 3.3.arrange #######################################################
##arrange�� ���� ���(Ư������(��) �������� �������� �Ǵ� ������������ ����)

##month, day ������ ��������
arrange_flight_df<-
  flight_df %>%
  arrange(month, day) 

##month�� ��������, day�� ��������
arrange_flight_df<-
  flight_df %>%
  arrange(month, -day) 
#�Ǵ�
arrange_flight_df<-
  flight_df %>%
  arrange(month, desc(day))

##month, day ������ ��������
arrange_flight_df<-
  flight_df %>%
  arrange(-month, -day) 
#�Ǵ�
arrange_flight_df<-
  flight_df %>%
  arrange(desc(month), desc(day))


### 3.4.mutate ######################################################
##mutate�� ���ο� ������ �������(�Ļ�����(derived variables)����)

#������ ���� ���ο� ���� ����
flight_df %>%
  mutate(mean_distance=distance/hour, 
         ratio_delay=arr_delay/(hour*60+minute))

#ifelse�� Ȱ���Ͽ� category���� ����
flight_df %>%
  mutate(arr_delay_group=ifelse(arr_delay>0, "delay", "no delay"))


#���� ������ ���� ������ ���ɾ� ����ÿ��� ������ ������
#���� ������ �ϴ� ���ɾ �߰��ؾ� ��
mutate_flight_df<-
  flight_df %>%
  mutate(arr_delay_group=ifelse(arr_delay>0, "delay", "no delay"))


#���� ������ �������� �ᵵ ����(ȭ��ǥ�� �ݴ�, logic�� �����ϸ� ������ ���� ����)
flight_df %>%
  mutate(arr_delay_group=ifelse(arr_delay>0, "delay", "no delay"))->mutate1_flight_df

### 3.5. group_by�� summarise ######################################################
##group_by�� Ư�� ������ grouping�ϴ� �� (����(��/��)�� ���� �����͸� split)
##summarize�� group_by�� ������ ���� ����. �׷캰�� Ư�� ������ ���� ���(���, �л� ��)�Ҷ� ���
flight_df %>%
  group_by(month)

mutate1_flight_df %>% 
  group_by(arr_delay_group) %>% 
  summarise(max=max(arr_delay),
            min=min(arr_delay), 
            mean=mean(arr_delay), 
            med=median(arr_delay), 
            per20=quantile(arr_delay, 0,25))

#missing ���� �־ ����� �׷����� �ȵǰ� ������ Ȯ��. filter�� ���� na ���� ���ְ� �м��غ���

flight_df %>%
  filter(!is.na(arr_delay)) %>%  #na�� �ƴ� row�� ǥ��
  mutate(arr_delay_group=ifelse(arr_delay>0, "delay", "no delay")) %>% 
  group_by(arr_delay_group) %>% 
  summarise(max=max(arr_delay),
            min=min(arr_delay), 
            mean=mean(arr_delay), 
            med=median(arr_delay), 
            per20=quantile(arr_delay, 0,25))->final
final

##summarise : �����跮 ���
#mean(x,na.rm=TRUE) : �����������ϰ� ���
#median(x,na.rm=TRUE) : �߾Ӱ�
#sd(x,na.rm=TRUE) : ǥ������
#min(x,na.rm=TRUE) : �ּڰ�
#max(x,na.rm=TRUE) : �ִ밪
#IQR(x,na.rm=TRUE) : ������� : Q3-Q1
#sum(x,na.rm=TRUE) : ��

#n() ����ġ ���� ���, x���� �Է� ���� ����
#n_disinct(x) : �ߺ����� ������ ����ġ ���� ���
###�ǽ�######
mutate1_flight_df %>% 
  group_by(arr_delay_group) %>% 
  summarise(n=n())

mutate1_flight_df %>% 
  filter(!is.na(arr_delay)) %>% 
  group_by(arr_delay_group) %>% 
  summarise(n=n())
##rename : ���� �̸� ����
str(mutate1_flight_df)
mutate2_flight_df<- rename(mutate1_flight_df, destination=dest)
str(mutate2_flight_df)


### 3.6. ��ġ��  ######################################################

## dplyr�� chain operator�� �������� ����� �帧��� �ڵ带 �����ϰ� ©�� �ִٴ� ����
## ��, �ڵ��� ������ �ſ� �߿���. �츮�� ������ �ϴ� ������ �ٸ��� ���� �ٸ���ó�� ���� �ۼ��� �ڵ� ������� 
##   ������ �Ǳ� ������ �ڵ带 ¥�� ���� �̸� ������ ����, ����, ������ ������ �Ӹ��ӿ� ������ �ʿ䰡 ����
## ���� �ٸ� chain operator�� �ٸ� ��Ű��(��: ggplot2)�� �����ͼ� ������ �ֱ� ������ �ſ� ������

install.packages('ggplot2')
library(ggplot2)

flight_df %>%
  filter(!is.na(arr_delay)) %>% 
  group_by(month) %>% 
  summarise(max=max(arr_delay)) %>% 
  ggplot(.,aes(x=month, y=max))+geom_line()