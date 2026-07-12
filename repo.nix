{
  name = "rust-service";
  language = "rust";

  ci = {
    security = true;
    release = false;
  };

  kubernetes = {
    helm = true;
    argocd = false;
  };

  codeowners = [ "@Fomiller" "@platform-team" ];
}
