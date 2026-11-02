ManifestDPIAware true

!macro customInit
  System::Call 'USER32::SetProcessDPIAware()'
!macroend
