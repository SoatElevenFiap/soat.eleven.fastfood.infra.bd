terraform { 
  cloud {    
    organization = "SoatElevenFiap" 

    workspaces { 
      name = "SoatElevenFiapBd" 
    } 
  } 
}