#! /bin/bash
  if [ "$raceethnicity" == "group_A" ]; then
    if [ "$parental_level_of_education" == "associates_degree" ]; then
      if [ "$lunch" == "freereduced" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "none" ]; then result="4"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          elif [ "$test_preparation_course" == "none" ]; then result="4"
          fi
        fi
      elif [ "$lunch" == "standard" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="8"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="8"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "bachelors_degree" ]; then
      if [ "$gender" == "female" ]; then
        if [ "$lunch" == "standard" ]; then
          if [ "$test_preparation_course" == "none" ]; then result="5"
          fi
        fi
      elif [ "$gender" == "male" ]; then
        if [ "$test_preparation_course" == "completed" ]; then
          if [ "$lunch" == "freereduced" ]; then result="5"
          elif [ "$lunch" == "standard" ]; then result="8"
          fi
        elif [ "$test_preparation_course" == "none" ]; then
          if [ "$lunch" == "freereduced" ]; then result="6"
          elif [ "$lunch" == "standard" ]; then result="6"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "high_school" ]; then
      if [ "$lunch" == "freereduced" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          elif [ "$test_preparation_course" == "none" ]; then result="4"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          elif [ "$test_preparation_course" == "none" ]; then result="5"
          fi
        fi
      elif [ "$lunch" == "standard" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="9"
          elif [ "$test_preparation_course" == "none" ]; then result="6"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="6"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "masters_degree" ]; then
      if [ "$gender" == "female" ]; then result="5"
      elif [ "$gender" == "male" ]; then
        if [ "$lunch" == "freereduced" ]; then
          if [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        elif [ "$lunch" == "standard" ]; then result="5"
        fi
      fi
    elif [ "$parental_level_of_education" == "some_college" ]; then
      if [ "$test_preparation_course" == "completed" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$lunch" == "standard" ]; then result="8"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$lunch" == "freereduced" ]; then result="8"
          elif [ "$lunch" == "standard" ]; then result="8"
          fi
        fi
      elif [ "$test_preparation_course" == "none" ]; then
        if [ "$lunch" == "freereduced" ]; then
          if [ "$gender" == "female" ]; then result="6"
          elif [ "$gender" == "male" ]; then result="6"
          fi
        elif [ "$lunch" == "standard" ]; then
          if [ "$gender" == "female" ]; then result="6"
          elif [ "$gender" == "male" ]; then result="7"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "some_high_school" ]; then
      if [ "$lunch" == "freereduced" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "none" ]; then result="4"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="6"
          elif [ "$test_preparation_course" == "none" ]; then result="4"
          fi
        fi
      elif [ "$lunch" == "standard" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="9"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="9"
          elif [ "$test_preparation_course" == "none" ]; then result="5"
          fi
        fi
      fi
    fi
  elif [ "$raceethnicity" == "group_B" ]; then
    if [ "$parental_level_of_education" == "associates_degree" ]; then
      if [ "$gender" == "female" ]; then
        if [ "$test_preparation_course" == "completed" ]; then
          if [ "$lunch" == "freereduced" ]; then result="8"
          elif [ "$lunch" == "standard" ]; then result="9"
          fi
        elif [ "$test_preparation_course" == "none" ]; then
          if [ "$lunch" == "freereduced" ]; then result="5"
          elif [ "$lunch" == "standard" ]; then result="7"
          fi
        fi
      elif [ "$gender" == "male" ]; then
        if [ "$test_preparation_course" == "completed" ]; then
          if [ "$lunch" == "freereduced" ]; then result="8"
          elif [ "$lunch" == "standard" ]; then result="9"
          fi
        elif [ "$test_preparation_course" == "none" ]; then
          if [ "$lunch" == "freereduced" ]; then result="5"
          elif [ "$lunch" == "standard" ]; then result="8"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "bachelors_degree" ]; then
      if [ "$gender" == "female" ]; then
        if [ "$lunch" == "freereduced" ]; then result="8"
        elif [ "$lunch" == "standard" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        fi
      elif [ "$gender" == "male" ]; then
        if [ "$lunch" == "freereduced" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="9"
          elif [ "$test_preparation_course" == "none" ]; then result="8"
          fi
        elif [ "$lunch" == "standard" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "high_school" ]; then
      if [ "$lunch" == "freereduced" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="5"
          fi
        fi
      elif [ "$lunch" == "standard" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "masters_degree" ]; then
      if [ "$lunch" == "freereduced" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          elif [ "$test_preparation_course" == "none" ]; then result="5"
          fi
        fi
      elif [ "$lunch" == "standard" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "none" ]; then result="9"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "some_college" ]; then
      if [ "$test_preparation_course" == "completed" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$lunch" == "freereduced" ]; then result="5"
          elif [ "$lunch" == "standard" ]; then result="9"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$lunch" == "freereduced" ]; then result="7"
          elif [ "$lunch" == "standard" ]; then result="9"
          fi
        fi
      elif [ "$test_preparation_course" == "none" ]; then
        if [ "$lunch" == "freereduced" ]; then
          if [ "$gender" == "female" ]; then result="6"
          elif [ "$gender" == "male" ]; then result="6"
          fi
        elif [ "$lunch" == "standard" ]; then
          if [ "$gender" == "female" ]; then result="8"
          elif [ "$gender" == "male" ]; then result="6"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "some_high_school" ]; then
      if [ "$lunch" == "freereduced" ]; then
        if [ "$test_preparation_course" == "completed" ]; then
          if [ "$gender" == "female" ]; then result="6"
          elif [ "$gender" == "male" ]; then result="6"
          fi
        elif [ "$test_preparation_course" == "none" ]; then
          if [ "$gender" == "female" ]; then result="2"
          elif [ "$gender" == "male" ]; then result="5"
          fi
        fi
      elif [ "$lunch" == "standard" ]; then
        if [ "$test_preparation_course" == "completed" ]; then
          if [ "$gender" == "female" ]; then result="6"
          elif [ "$gender" == "male" ]; then result="6"
          fi
        elif [ "$test_preparation_course" == "none" ]; then
          if [ "$gender" == "female" ]; then result="7"
          elif [ "$gender" == "male" ]; then result="7"
          fi
        fi
      fi
    fi
  elif [ "$raceethnicity" == "group_C" ]; then
    if [ "$parental_level_of_education" == "associates_degree" ]; then
      if [ "$test_preparation_course" == "completed" ]; then
        if [ "$lunch" == "freereduced" ]; then
          if [ "$gender" == "female" ]; then result="8"
          elif [ "$gender" == "male" ]; then result="7"
          fi
        elif [ "$lunch" == "standard" ]; then
          if [ "$gender" == "female" ]; then result="7"
          elif [ "$gender" == "male" ]; then result="7"
          fi
        fi
      elif [ "$test_preparation_course" == "none" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$lunch" == "freereduced" ]; then result="6"
          elif [ "$lunch" == "standard" ]; then result="6"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$lunch" == "freereduced" ]; then result="6"
          elif [ "$lunch" == "standard" ]; then result="5"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "bachelors_degree" ]; then
      if [ "$lunch" == "freereduced" ]; then
        if [ "$test_preparation_course" == "completed" ]; then
          if [ "$gender" == "female" ]; then result="7"
          elif [ "$gender" == "male" ]; then result="7"
          fi
        elif [ "$test_preparation_course" == "none" ]; then
          if [ "$gender" == "female" ]; then result="4"
          elif [ "$gender" == "male" ]; then result="4"
          fi
        fi
      elif [ "$lunch" == "standard" ]; then
        if [ "$test_preparation_course" == "completed" ]; then
          if [ "$gender" == "female" ]; then result="8"
          elif [ "$gender" == "male" ]; then result="9"
          fi
        elif [ "$test_preparation_course" == "none" ]; then
          if [ "$gender" == "female" ]; then result="8"
          elif [ "$gender" == "male" ]; then result="8"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "high_school" ]; then
      if [ "$lunch" == "freereduced" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="4"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="5"
          elif [ "$test_preparation_course" == "none" ]; then result="6"
          fi
        fi
      elif [ "$lunch" == "standard" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "masters_degree" ]; then
      if [ "$lunch" == "freereduced" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="5"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="5"
          fi
        fi
      elif [ "$lunch" == "standard" ]; then
        if [ "$test_preparation_course" == "completed" ]; then
          if [ "$gender" == "female" ]; then result="8"
          elif [ "$gender" == "male" ]; then result="9"
          fi
        elif [ "$test_preparation_course" == "none" ]; then
          if [ "$gender" == "female" ]; then result="7"
          elif [ "$gender" == "male" ]; then result="7"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "some_college" ]; then
      if [ "$lunch" == "freereduced" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="6"
          elif [ "$test_preparation_course" == "none" ]; then result="6"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="6"
          fi
        fi
      elif [ "$lunch" == "standard" ]; then
        if [ "$test_preparation_course" == "completed" ]; then
          if [ "$gender" == "female" ]; then result="7"
          elif [ "$gender" == "male" ]; then result="7"
          fi
        elif [ "$test_preparation_course" == "none" ]; then
          if [ "$gender" == "female" ]; then result="6"
          elif [ "$gender" == "male" ]; then result="6"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "some_high_school" ]; then
      if [ "$gender" == "female" ]; then
        if [ "$lunch" == "freereduced" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="5"
          fi
        elif [ "$lunch" == "standard" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        fi
      elif [ "$gender" == "male" ]; then
        if [ "$lunch" == "freereduced" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="5"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        elif [ "$lunch" == "standard" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        fi
      fi
    fi
  elif [ "$raceethnicity" == "group_D" ]; then
    if [ "$parental_level_of_education" == "associates_degree" ]; then
      if [ "$lunch" == "freereduced" ]; then
        if [ "$test_preparation_course" == "completed" ]; then
          if [ "$gender" == "female" ]; then result="8"
          elif [ "$gender" == "male" ]; then result="8"
          fi
        elif [ "$test_preparation_course" == "none" ]; then
          if [ "$gender" == "female" ]; then result="5"
          elif [ "$gender" == "male" ]; then result="5"
          fi
        fi
      elif [ "$lunch" == "standard" ]; then
        if [ "$test_preparation_course" == "completed" ]; then
          if [ "$gender" == "female" ]; then result="9"
          elif [ "$gender" == "male" ]; then result="7"
          fi
        elif [ "$test_preparation_course" == "none" ]; then
          if [ "$gender" == "female" ]; then result="8"
          elif [ "$gender" == "male" ]; then result="8"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "bachelors_degree" ]; then
      if [ "$test_preparation_course" == "completed" ]; then
        if [ "$lunch" == "freereduced" ]; then
          if [ "$gender" == "female" ]; then result="9"
          elif [ "$gender" == "male" ]; then result="7"
          fi
        elif [ "$lunch" == "standard" ]; then result="7"
        fi
      elif [ "$test_preparation_course" == "none" ]; then
        if [ "$lunch" == "freereduced" ]; then
          if [ "$gender" == "female" ]; then result="6"
          elif [ "$gender" == "male" ]; then result="6"
          fi
        elif [ "$lunch" == "standard" ]; then
          if [ "$gender" == "female" ]; then result="8"
          elif [ "$gender" == "male" ]; then result="8"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "high_school" ]; then
      if [ "$lunch" == "freereduced" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="5"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        fi
      elif [ "$lunch" == "standard" ]; then
        if [ "$test_preparation_course" == "completed" ]; then
          if [ "$gender" == "female" ]; then result="6"
          elif [ "$gender" == "male" ]; then result="7"
          fi
        elif [ "$test_preparation_course" == "none" ]; then
          if [ "$gender" == "female" ]; then result="7"
          elif [ "$gender" == "male" ]; then result="7"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "masters_degree" ]; then
      if [ "$gender" == "female" ]; then
        if [ "$lunch" == "freereduced" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="9"
          elif [ "$test_preparation_course" == "none" ]; then result="4"
          fi
        elif [ "$lunch" == "standard" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          elif [ "$test_preparation_course" == "none" ]; then result="6"
          fi
        fi
      elif [ "$gender" == "male" ]; then
        if [ "$lunch" == "freereduced" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="9"
          elif [ "$test_preparation_course" == "none" ]; then result="4"
          fi
        elif [ "$lunch" == "standard" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          elif [ "$test_preparation_course" == "none" ]; then result="9"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "some_college" ]; then
      if [ "$lunch" == "freereduced" ]; then
        if [ "$test_preparation_course" == "completed" ]; then
          if [ "$gender" == "female" ]; then result="6"
          elif [ "$gender" == "male" ]; then result="7"
          fi
        elif [ "$test_preparation_course" == "none" ]; then
          if [ "$gender" == "female" ]; then result="6"
          elif [ "$gender" == "male" ]; then result="6"
          fi
        fi
      elif [ "$lunch" == "standard" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "some_high_school" ]; then
      if [ "$lunch" == "freereduced" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="4"
          elif [ "$test_preparation_course" == "none" ]; then result="5"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="4"
          elif [ "$test_preparation_course" == "none" ]; then result="6"
          fi
        fi
      elif [ "$lunch" == "standard" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        fi
      fi
    fi
  elif [ "$raceethnicity" == "group_E" ]; then
    if [ "$parental_level_of_education" == "associates_degree" ]; then
      if [ "$test_preparation_course" == "completed" ]; then
        if [ "$lunch" == "freereduced" ]; then
          if [ "$gender" == "female" ]; then result="8"
          elif [ "$gender" == "male" ]; then result="8"
          fi
        elif [ "$lunch" == "standard" ]; then
          if [ "$gender" == "female" ]; then result="8"
          elif [ "$gender" == "male" ]; then result="8"
          fi
        fi
      elif [ "$test_preparation_course" == "none" ]; then
        if [ "$lunch" == "freereduced" ]; then
          if [ "$gender" == "female" ]; then result="7"
          elif [ "$gender" == "male" ]; then result="7"
          fi
        elif [ "$lunch" == "standard" ]; then
          if [ "$gender" == "female" ]; then result="9"
          elif [ "$gender" == "male" ]; then result="9"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "bachelors_degree" ]; then
      if [ "$test_preparation_course" == "completed" ]; then
        if [ "$lunch" == "freereduced" ]; then
          if [ "$gender" == "female" ]; then result="9"
          elif [ "$gender" == "male" ]; then result="9"
          fi
        elif [ "$lunch" == "standard" ]; then
          if [ "$gender" == "female" ]; then result="8"
          elif [ "$gender" == "male" ]; then result="8"
          fi
        fi
      elif [ "$test_preparation_course" == "none" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$lunch" == "freereduced" ]; then result="6"
          elif [ "$lunch" == "standard" ]; then result="8"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$lunch" == "freereduced" ]; then result="6"
          elif [ "$lunch" == "standard" ]; then result="8"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "high_school" ]; then
      if [ "$gender" == "female" ]; then
        if [ "$lunch" == "freereduced" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        elif [ "$lunch" == "standard" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          elif [ "$test_preparation_course" == "none" ]; then result="8"
          fi
        fi
      elif [ "$gender" == "male" ]; then
        if [ "$lunch" == "freereduced" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="6"
          fi
        elif [ "$lunch" == "standard" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          elif [ "$test_preparation_course" == "none" ]; then result="8"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "masters_degree" ]; then
      if [ "$test_preparation_course" == "completed" ]; then result="9"
      elif [ "$test_preparation_course" == "none" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$lunch" == "freereduced" ]; then result="8"
          elif [ "$lunch" == "standard" ]; then result="8"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$lunch" == "freereduced" ]; then result="8"
          elif [ "$lunch" == "standard" ]; then result="9"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "some_college" ]; then
      if [ "$lunch" == "freereduced" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="9"
          elif [ "$test_preparation_course" == "none" ]; then result="9"
          fi
        fi
      elif [ "$lunch" == "standard" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="7"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="9"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        fi
      fi
    elif [ "$parental_level_of_education" == "some_high_school" ]; then
      if [ "$lunch" == "freereduced" ]; then
        if [ "$gender" == "female" ]; then
          if [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          elif [ "$test_preparation_course" == "none" ]; then result="7"
          fi
        fi
      elif [ "$lunch" == "standard" ]; then
        if [ "$gender" == "female" ]; then result="8"
        elif [ "$gender" == "male" ]; then
          if [ "$test_preparation_course" == "completed" ]; then result="8"
          elif [ "$test_preparation_course" == "none" ]; then result="9"
          fi
        fi
      fi
    fi
  fi
echo "$result"
