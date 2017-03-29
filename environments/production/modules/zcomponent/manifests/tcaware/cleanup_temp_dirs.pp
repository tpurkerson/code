class zcomponent::tcaware::cleanup_temp_dirs (
  $all_temp_dirs,
  $tidy_tempfiles_max_age
)
  {
notify {"Here in tidy - ${all_temp_dirs} and ${tidy_tempfiles_max_age}" :}

    tidy { $all_temp_dirs:
#      age     => $tidy_tempfiles_max_age,
      recurse => true,
#      rmdirs  => true,
      backup  => false
    }
    tidy { '/tmp/tidytest/shouldnotbehere.txt':
      backup => false,
    }
  }
