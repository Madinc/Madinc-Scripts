#!/bin/bash
#######################################################################
#######################################################################
##Name            :bs-header.sh
##Description     :This script will make a header for a bash script
##Author	  :madinc
##Mail            :madinc29@gmail.com
##Date            :05/21/2013 07:44:29 PM CEST
##Version         :0.1
##Usage	          :bash bs-header.sh
##Notes           :
##Bash_version    :4.2.24(1)-release
##License         :GNU General Public License.
##bs-header.sh is free software; you can redistribute it and/or,
##modify it under the terms of the GNU General Public License,
##as published by the Free Software Foundation; either version 3,
##of the License, or (at your option) any later version.
##bs-header.sh is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of,
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
##See the GNU General Public License for more details.
##You should have received a copy of the GNU General Public License,
##with your GNU/Linux system, in /usr/share/common-licenses/GPL.
##If not, see <http://www.gnu.org/licenses/> or write to the,
##Free Software Foundation Inc., 51 Franklin St, Fifth Floor,
##Boston, MA 02110-1301, USA.
#######################################################################
#######################################################################

#variables
TODAY=$(date +"%x %r %Z")

#functions
function select_name()
{
        #get the script name
        printf "Enter A Name: " ; read -r NAME
        #remove the spaces from the name if necessary
        NAME=${NAME// /_}
        #convert uppercase to lowercase
        NAME=${NAME,,}
        #add .sh to the end of the name if it is not there already
        [ "${NAME: -3}" != '.sh' ] && NAME=${NAME}.sh
        #check to see if the script exists already
        if [ -e $NAME ] ; then
                        printf "\n%s\n%s\n\n" "The Script \"$NAME\" Already Exists." \
                                "Please Select Another Name."
        select_name
        fi
}



function user_info()
{
        #script description
        printf "Enter A Description: " ; read -r SCRPTDSCR
        #script version
        printf "Enter The Version Number: " ; read -r SCRPTVRSN
}



function write_script()
{
cat <<- _EOF_
#!/bin/bash -x
#######################################################################
#######################################################################
##Name            :$NAME
##Description     :$SCRPTDSCR
##Author          :$USER
##Mail            :madinc29@gmail.com
##Date            :$TODAY
##Version         :$SCRPTVRSN
##Usage           :bash $NAME
##Notes           :
##Bash_version    :$BASH_VERSION
##License         :GNU General Public License.
##$NAME is free software; you can redistribute it and/or,
##modify it under the terms of the GNU General Public License,
##as published by the Free Software Foundation; either version 3,
##of the License, or (at your option) any later version.
##$NAME is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of,
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
##See the GNU General Public License for more details.
##You should have received a copy of the GNU General Public License,
##with your GNU/Linux system, in /usr/share/common-licenses/GPL.
##If not, see <http://www.gnu.org/licenses/> or write to the,
##Free Software Foundation Inc., 51 Franklin St, Fifth Floor,
##Boston, MA 02110-1301, USA.
#######################################################################
#######################################################################
_EOF_
}

#call function
select_name
user_info

#call function and generate the script
write_script > $NAME

#make the generated script executable.
chmod +x $NAME
#exit script with succes
exit 0
