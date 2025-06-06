pkg_list <- yaml::read_yaml("app/r_pkgs.yaml")
unlist(pkg_list, use.names=F) |> 
    renv::install()