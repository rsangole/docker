pkg_list <- yaml::read_yaml("r_pkgs.yml")
unlist(pkg_list, use.names=F) |> 
    renv::install()
remotes::install_github("nx10/httpgd")