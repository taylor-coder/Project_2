
*setting the library for files;
libname aspph "C:\Users\tt1102\Google Drive\T Taylor\ASPPH";

/* Show the configuration file and the encoding setting for the SAS session */
proc options option=config; run;
proc options group=languagecontrol; run; 

/* Show the encoding value for the problematic data set */
%let dsn=aspph;
%let dsid=%sysfunc(open(&dsn,i));
%put &dsn ENCODING is: %sysfunc(attrc(&dsid,encoding));

proc datasets lib=aspph;
modify aspph_sas/correctencoding=utf8;
run;

*pulling in the data set;
data aspph;
set aspph.aspph_sas;
run;

*checking contents of data set for correct varaibles;
proc contents data=aspph; 
run;

*for categorical variables;
*chis-square is p-value;
*fisher is the nonparametric p-value;


/*Membertype */ 
proc freq data=aspph;
table member_type*responder/chisq fisher;
run;

/*Membersupporttype*/ 

proc freq data=aspph;
table membersupporttype*responder/chisq fisher;
run;

/*Faculty - MALE */

PROC TTEST DATA = aspph;
VAR facultymalecount;
CLASS responder;
RUN;

PROC TTEST DATA = aspph;
VAR per_male_faculty;
CLASS responder;
RUN;

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR facultymalecount;
	**EXACT WILCOXON;
RUN; 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_male_faculty;
	**EXACT WILCOXON;
RUN; 

/*Faculty - Female */ 

PROC TTEST DATA=aspph;
var facultyfemalecount;
class responder;
run;

PROC TTEST DATA = aspph;
VAR per_female_faculty;
CLASS responder;
RUN;

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR facultyfemalecount;
	**EXACT WILCOXON;
RUN; 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_female_faculty;
	**EXACT WILCOXON;
RUN; 

/* Faculty - American Indian */

proc contents data=aspph;
run;

PROC TTEST DATA = aspph;
VAR FacultyAmericanIndianAlaskaNativ;
CLASS responder;
RUN; 

PROC TTEST DATA = aspph;
VAR per_AIAN_faculty;
CLASS responder;
RUN; 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR FacultyAmericanIndianAlaskaNativ;
	**EXACT WILCOXON;
RUN; 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_AIAN_faculty;
	**EXACT WILCOXON;
RUN; 

/* Faculty - Asian */ 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR FacultyAsian;
	**EXACT WILCOXON;
RUN; 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_asian_faculty;
	**EXACT WILCOXON;
RUN; 

PROC TTEST DATA = aspph;
VAR FacultyAsian;
CLASS responder;
RUN; 

PROC TTEST DATA = aspph;
VAR per_asian_faculty;
CLASS responder;
RUN; 


/*FACULTY - BLACK */

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR FacultyBlackorAfricanAmerican;
	**EXACT WILCOXON;
RUN; 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_black_faculty;
	**EXACT WILCOXON;
RUN; 

PROC TTEST DATA = aspph;
VAR FacultyBlackorAfricanAmerican;
CLASS responder;
RUN; 

PROC TTEST DATA = aspph;
VAR per_black_faculty;
CLASS responder;
RUN; 

/*FACULTY - HISPANIC */

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR FacultyHispanicLatino;
	**EXACT WILCOXON;
RUN; 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_hl_faculty;
	**EXACT WILCOXON;
RUN; 

PROC TTEST DATA = aspph;
VAR FacultyHispanicLatino;
CLASS responder;
RUN; 

PROC TTEST DATA = aspph;
VAR per_hl_faculty;
CLASS responder;
RUN; 

/*Faculty - Native Hawaiian */ 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR FacultyNativeHawaiianPacificIsla;
	**EXACT WILCOXON;
RUN; 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_NHPI_faculty;
	**EXACT WILCOXON;
RUN; 

PROC TTEST DATA = aspph;
VAR FacultyNativeHawaiianPacificIsla;
CLASS responder;
RUN; 

PROC TTEST DATA = aspph;
VAR per_NHPI_faculty;
CLASS responder;
RUN; 

/*Faculty - 2+ races */

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR FacultyTwoorMoreRaces;
	**EXACT WILCOXON;
RUN; 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_2race_faculty;
	**EXACT WILCOXON;
RUN; 

PROC TTEST DATA = aspph;
VAR FacultyTwoorMoreRaces;
CLASS responder;
RUN; 

PROC TTEST DATA = aspph;
VAR per_2race_faculty;
CLASS responder;
RUN; 

/* Faculty - White */ 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR FacultyWhite;
	**EXACT WILCOXON;
RUN; 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_white_faculty;
	**EXACT WILCOXON;
RUN; 

PROC TTEST DATA = aspph;
VAR FacultyWhite;
CLASS responder;
RUN; 

PROC TTEST DATA = aspph;
VAR per_white_faculty;
CLASS responder;
RUN; 



/*
StudentAmericanIndianAlaskaNativ
StudentAsian
StudentBlackorAfricanAmerican
StudentFemale
StudentForeign
StudentHispanicLatino
StudentMale
StudentNativeHawaiianPacificIsla
per_2race_student
per_AIAN_student
per_NHAN_student
per_asian_student
per_black_student
per_female_student
per_latino_student
per_male_student
per_white_student
*/

proc contents data=aspph;
run; 

/* FOREIGN - Students */ 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR StudentForeign;
	**EXACT WILCOXON;
RUN; 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_foreign_student;
	**EXACT WILCOXON;
RUN; 

PROC TTEST DATA = aspph;
VAR StudentForeign;
CLASS responder;
RUN; 

PROC TTEST DATA = aspph;
VAR per_foreign_student;
CLASS responder;
RUN; 

/* White - STUDENTS */ 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR StudentWhite;
	**EXACT WILCOXON;
RUN; 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_white_student;
	**EXACT WILCOXON;
RUN; 

PROC TTEST DATA = aspph;
VAR StudentWhite;
CLASS responder;
RUN; 

PROC TTEST DATA = aspph;
VAR per_white_student;
CLASS responder;
RUN; 

/* Two or more - STUDENTS */ 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR StudentTwoorMoreRaces;
	**EXACT WILCOXON;
RUN; 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_2race_student;
	**EXACT WILCOXON;
RUN; 

PROC TTEST DATA = aspph;
VAR StudentTwoorMoreRaces;
CLASS responder;
RUN; 

PROC TTEST DATA = aspph;
VAR per_2race_student;
CLASS responder;
RUN; 

/* Native Hawaiian - STUDENTS */ 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR StudentNativeHawaiianPacificIsla;
	**EXACT WILCOXON;
RUN; 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_NHAN_student;
	**EXACT WILCOXON;
RUN; 

PROC TTEST DATA = aspph;
VAR StudentNativeHawaiianPacificIsla;
CLASS responder;
RUN; 

PROC TTEST DATA = aspph;
VAR per_NHAN_student;
CLASS responder;
RUN; 

/* Hispanic/Latino - STUDENTS */ 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR StudentHispanicLatino;
	**EXACT WILCOXON;
RUN; 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_latino_student;
	**EXACT WILCOXON;
RUN; 

PROC TTEST DATA = aspph;
VAR StudentHispanicLatino;
CLASS responder;
RUN; 

PROC TTEST DATA = aspph;
VAR per_latino_student;
CLASS responder;
RUN; 

/* Student - Black */ 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR StudentBlackorAfricanAmerican;
	**EXACT WILCOXON;
RUN; 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_black_student;
	**EXACT WILCOXON;
RUN; 

PROC TTEST DATA = aspph;
VAR StudentBlackorAfricanAmerican;
CLASS responder;
RUN; 

PROC TTEST DATA = aspph;
VAR per_black_student;
CLASS responder;
RUN; 

/*Student - American Indian...*/ 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR StudentAmericanIndianAlaskaNativ;
	**EXACT WILCOXON;
RUN;

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_AIAN_student;
	**EXACT WILCOXON;
RUN;

PROC TTEST DATA = aspph;
VAR StudentAmericanIndianAlaskaNativ;
CLASS responder;
RUN; 

PROC TTEST DATA = aspph;
VAR per_AIAN_student;
CLASS responder;
RUN; 


/* Student - Asian */

PROC TTEST DATA = aspph;
VAR studentasian;
CLASS responder;
RUN; 

PROC TTEST DATA = aspph;
VAR per_AIAN_student;
CLASS responder;
RUN; 

proc freq data=aspph;
table studentasian*responder/chisq fisher;
run; 

proc freq data=aspph;
table per_AIAN_student*responder/chisq fisher;
run;


/*for continuous variables (counts and percentages)*/

PROC TTEST DATA = aspph;
Var Facultyfemalecount;
Class responder;
Run;

PROC TTEST DATA = aspph; 
var per_female_student;
class responder; 
run; 

proc freq data=aspph;
table studentfemale*responder/chisq fisher;
run;

proc freq data=aspph;
table per_female_student*responder/chisq fisher;
run; 

/*Student - Male */ 

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR StudentMale;
	**EXACT WILCOXON;
RUN;

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_male_student;
	**EXACT WILCOXON;
RUN;

/*Student - FEMALE */

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR StudentfeMale;
	**EXACT WILCOXON;
RUN;

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_female_student;
	**EXACT WILCOXON;
RUN;


/* Program years - calculation */ 

PROC TTEST DATA = aspph;
VAR program_years;
CLASS responder;
RUN;

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR program_years;
	**EXACT WILCOXON;
RUN;


/*recheckin Data set*/ 

proc contents data=aspph;
run;

/*in this code the pooled p-value should match the one 
I have in the table but I pulled the wrong one so you should pull Satterthwaite p-value; */

*nonparametric for continuous variables;
PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR StudentFemale;
	**EXACT WILCOXON;
RUN;

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_female_student;
	**EXACT WILCOXON;
RUN;

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR StudentMale;
	**EXACT WILCOXON;
RUN;

PROC NPAR1WAY DATA = aspph WILCOXON CORRECT = NO;
	CLASS responder;
	VAR per_male_student;
	**EXACT WILCOXON;
RUN;

*from this output pull the Wilcoxon Two-sample test p-value for two-sided Z approximation;



*********************GRAVEYARD**********************;
/*
*sort data by responder for analysis;
proc sort data=aspph;
by responder;
run;

proc means;
var StudentFemale;
by responder;
run;
*/
