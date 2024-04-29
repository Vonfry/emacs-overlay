self: super:
{
  emacsPackagesFor = emacs: (
    (super.emacsPackagesFor emacs).overrideScope (
      eself: esuper:
        let
          melpaStablePackages = esuper.melpaStablePackages.override {
            archiveJson = ../repos/melpa/recipes-archive-melpa.json;
          };

          melpaPackages = esuper.melpaPackages.override {
            archiveJson = ../repos/melpa/recipes-archive-melpa.json;
          };

          elpaDevelPackages = esuper.elpaDevelPackages.override {
            archiveJson = ../repos/melpa/recipes-archive-elpa-devel.json;
          };

          elpaPackages = esuper.elpaPackages.override {
            archiveJson = ../repos/melpa/recipes-archive-elpa.json;
          };

          nongnuPackages = esuper.nongnuPackages.override {
            archiveJson = ../repos/melpa/recipes-archive-nongnu.json;
          };

        in
          esuper.override {
            inherit melpaStablePackages melpaPackages elpaDevelPackages elpaPackages
              nongnuPackages;
          }

    )
  );

}
