while getopts ":t:a" opt; do
  case ${opt} in
    t )
      echo "there you go: $OPTARG" # When t has arguments
      ;;
    \? )
      echo "Invalid option: $OPTARG"  #There is no match flags
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument" 
      ;;
    a )
      echo "this is a";;
  esac
done
shift $((OPTIND -1))
echo 