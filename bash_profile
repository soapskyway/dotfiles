if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

#START OSIX
# Source OSIX definitions
[ -f ~/.osixrc ] && source ~/.osixrc

#Check that OSIXBASE exists
if [ ! -z "$OSIXBASE" ] && [ -e "$OSIXBASE" ]; then

  #Check if the OSIXBASE/bin is missing from PATH
  if [[ $PATH != *$OSIXBASE/bin* ]]; then

    # Add the bin dir to the PATH
    PATH=$PATH:$OSIXBASE/bin
  fi
fi
#END OSIX
