#!/usr/pkg/bin/bash
# Eleftheria Areti Marinou 5958

     
if [ "$1" != "" ] && [ "$2" != "" ];
then
		if [ "$1" == "-f" ] && [ "$3" == "" ];
		then

			#./tool.sh -f <file> 
			file=$(cat $2 | grep "^[^#]")
			echo "$file"
			exit 0;

		elif [ "$2" == "-f" ] && [ "$3" == "" ];
		then

			#./tool.sh <file> -f
			file=$(cat $2 | grep "^[^#]")
			echo "$file"
			exit 0;
		fi


		#--------------------------------------------------------------

		if [ "$1" == "-f" ] && [ "$3" == "-id" ];
		then

			#./tool.sh -f <file> -id <id>
			file=$(cat $2 | grep "^[^#]")  
			id=$4
			line=$(echo "$file" | grep ^"$id|")
			echo -n "$(echo "$line" | cut -f 2 -d '|') "
			echo -n "$(echo "$line" | cut -f 3 -d '|') "
			echo "$(echo "$line" | cut -f 5 -d '|') "
			exit 0;

		elif [ "$1" == "-id" ] && [ "$3" == "-f" ];
		then

			#.tool.sh -id <id> -f <file>
			file=$(cat $4 | grep "^[^#]")
			id=$2
			line=$(echo "$file" | grep ^"$id|")
			echo -n "$(echo "$line" | cut -f 2 -d '|') "
			echo -n "$(echo "$line" | cut -f 3 -d '|') "
			echo "$(echo "$line" | cut -f 5 -d '|')"
			exit 0;
		fi


		#--------------------------------------------------------------


		if [ "$1" == "--firstnames" ] && [ "$2" == "-f" ] ;
		then
				#./tool.sh --firstnames -f <file>
		   		arx=$(cat $3)
				file=$(echo "$arx" | grep "^[^#]")
		   		echo "$(echo "$file" | cut -f 2 -d '|' | sort -u)" 
		   		exit 0;

		elif [ "$1" == '-f' ] && [ "$3" == "--firstnames" ] ;
		then
				#.tool.sh -f <file> --firstnames
		        arx=$(cat $2)
				file=$(echo "$arx" | grep "^[^#]")
		        echo "$(echo "$file" | cut -f 2 -d '|' | sort -u)"
		        exit 0;
		fi


		#--------------------------------------------------------------


		if [ "$1" ==  "--lastnames" ] && [ "$2" == "-f" ] ;
		then

			#./tool.sh --lastnames -f <file>
		    file=$(cat $3)
			f=$(echo "$file" | grep "^[^#]")
		    echo "$(echo "$f" | cut -f 3 -d '|' | sort -u)" 
		    exit 0;

		elif [ "$1" == "-f" ] && [ "$3" == "--lastnames" ];
		then

			#./tool.sh -f <file> --lastnames
		    file=$(cat $2)
			f=$(echo "$file" | grep "^[^#]")
		    echo "$(echo "$f" | cut -f 3 -d '|' | sort -u)"
		    exit 0;
		fi


		#--------------------------------------------------------------


		if [ "$1" == "--browsers" ] && [ "$2" == "-f" ];
		then

			#./tool.sh --browsers -f <file>
			file=$(cat $3 | grep "^[^#]")
		     
		    res1=$(echo "$(echo "$file" | grep "Chrome")" | wc -l)
			echo "$echo Chrome "$res1""     
		 	res2=$(echo "$(echo "$file" | grep "Firefox")" | wc -l)
			echo "$echo Firefox "$res2""
		    res3=$(echo "$(echo "$file" | grep "Internet Explorer")" | wc -l)	
			echo "$echo Internet Explorer "$res3""
		    res4=$(echo "$(echo "$file" | grep "Opera")" | wc -l)	
			echo "$echo Opera "$res4""
		    res5=$(echo "$(echo "$file" | grep "Safari")" | wc -l)	
			echo "$echo Safari "$res5""
			exit 0;

		elif [ "$3" == "--browsers" ] && [ "$1" == "-f" ];
		then 

			#./tool.sh -f <file> --browsers
			file=$(cat $2 | grep "^[^#]")	  
		    res1=$(echo "$(echo "$file" | grep "Chrome")" | wc -l)
			echo "$echo Chrome "$res1""     
		 	res2=$(echo "$(echo "$file" | grep "Firefox")" | wc -l)
			echo "$echo Firefox "$res2""
		    res3=$(echo "$(echo "$file" | grep "Internet Explorer")" | wc -l)	
			echo "$echo Internet Explorer "$res3""	
		 	res4=$(echo "$(echo "$file" | grep "Opera")" | wc -l)	
			echo "$echo Opera "$res4""
		    res5=$(echo "$(echo "$file" | grep "Safari")" | wc -l)	
			echo "$echo Safari "$res5""
			exit 0;
		fi	

		#--------------------------------------------------------------

		if [ "$1" ==  "--born-since" ] && [ "$3" ==  "-f" ]; 
		then
			#./tool.sh --born-since <dateA> -f <file>
			file=$(cat $4 | grep "^[^#]")

			bs=$(cat $2)
			line=$(echo "$file" | cut -f 5 -d '|')
				 
				
			if [ "$(echo "$bs" | tr -d -)" ">" "$(cat $line | tr -d -)" ];
			then 
				echo "$(echo "$file" | grep ^"$line" | cut -f 5 -d '|') "
			fi

			exit 0;

		elif [ "$1" ==  "--born-until" ] && [ "$3" ==  "-f" ]; 
		then 

			#./tool.sh --born-until <dateb> -f <file>
				file=$(cat $4 | grep "^[^#]")

				bu=$(cat $2)	
				line=$(echo "$file" | cut -f 5 -d '|')
				 
			if [ "$(echo "$bu" | tr -d -)" "<" "$(cat $line | tr -d -)" ];
			then	
				echo "$(echo "$file" | grep ^"$line" | cut -f 5 -d '|') "
			fi
			exit 0;

		elif [ "$3" ==  "--born-until" ] && [ "$1" == "-f" ];
		then 

			#./tool.sh -f <file> --born-until <dateB>
			file=$(cat $2 | grep "^[^#]")
			bu=$(cat $4)	
			line=$(echo "$file" | cut -f 5 -d '|')

			if [ "$(echo "$bu" | tr -d -)" "<" "$(cat $line | tr -d -)" ];
			then	
				echo "$(echo "$file" | grep ^"$line" | cut -f 5 -d '|') "		
			fi
			exit 0;

		elif [ "$3" ==  "--born-since" ] && [ "$1" == "-f" ];
		then 
			#./tool.sh -f <file> --born-since <dateA>
			file=$(cat $2 | grep "^[^#]")
			bs=$(cat $4)
			line=$(echo "$file" | cut -f 5 -d '|')
				 
			if [ "$(echo "$bs" | tr -d -)" ">" "$(cat $line | tr -d -)" ];
			then 
				echo "$(echo "$file" | grep ^"$line" | cut -f 5 -d '|') "
			fi

			exit 0;

		elif [ "$3" ==  "--born-since" ] && [ "$1" == "-f" ] && [ "$5" == "--born-until" ];
		then

			#./tool.sh -f <file> --born-since <dateA> --born-until <dateB>
			file=$(cat $2 | grep "^[^#]")

				bs=$(cat $4)
				bu=$(cat $6)	
				line=$(echo "$file" | cut -f 5 -d '|')
				
			if [ "$(echo "$bs" | tr -d -)" ">" "$(cat $line | tr -d -)" ];
			then 
			if [ "$(echo "$bu" | tr -d -)" "<" "$(cat $line | tr -d -)" ];
			then	
			echo "$(echo "$file" | grep ^"$line" | cut -f 5 -d '|') "
			
			fi
			fi
			exit 0;
		fi


		#--------------------------------------------------------------


		if [ "$1" == "-f" ] && [ "$3" == "--edit" ]; 
		then

			#./tool.sh -f <file> --edit <id> <column> <value>
			file=$(cat $2 | grep "^[^#]")
			id=$4
			line=$(echo "$file" | grep ^"$id|")
			val=$6
			col=$5
			
			if [ $val -gt  1 ] && [ $val -lt 9 ];
			then
			lnew=${line/$(echo $line | cut -f $col -d '|')/$val}
			echo "$(echo "$lnew")"
			fi

		elif [ "$5" == "-f" ] && [ "$1" == "--edit" ]; 
		then	
			#./tool.sh --edit <id> <column> <value> -f <file>
			file=$(cat $6 | grep "^[^#]")
			id=$2
			line=$(echo "$file" | grep ^"$id|")
			val=$4
			col=$3
			
			if [ $val -gt  1 ] && [ $val -lt 9 ]
			then
			lnew=${line/$(echo $line | cut -f $col -d '|')/$val}
			echo "$(echo "$lnew")"
			fi	

		elif [ "$3" == "-f" ] && [ "$1" == "--edit" ];
		then

			#./tool.sh --edit <id> -f <file> <column> <value> 
			file=$(cat $3 | grep "^[^#]")
			id=$2
			line=$(echo "$file" | grep ^"$id|")

			val=$6
			col=$5
			
			if [ $val -gt  1 ] && [ $val -lt 9 ];
			then
			lnew=${line/$(echo $line | cut -f $col -d '|')/$val}
			echo "$(echo "$lnew")"
			fi	
		fi
else 
	echo 5958
fi
exit 0;
