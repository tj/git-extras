
# A version of the update code for when the update function has been disabled
# It just emits an error message
update() {
	echo "The self-update function has been disabled on this installation of git-extras."
	if [[ -n "$SELFUPDATE_DISABLED_MSG" ]]; then
		echo $SELFUPDATE_DISABLED_MSG
	fi
	false
}
