for d in ./*; do
  if [ -d "$d" ]; then
      echo "$d"
      cd $d
      rm  *~
      cd ..
  fi
done

