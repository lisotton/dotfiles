svndiff()
{
  svn diff "${@}" | colordiff | less
}
