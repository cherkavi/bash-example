function image-convert-to-vector() {
    if [[ -z $1 ]]; then
        echo "Image file was expected"
        return 1
    fi

    if [[ -z $2 ]]; then
        threshold="50%"
    else
        threshold=$2"%"
    fi 

    local input_image="$1"
    local output_svg="${input_image%.*}.svg"

    # Convert the image to a bitmap format (PBM)
    convert "$input_image" -threshold $threshold -monochrome "${input_image%.*}.pbm"

    # Convert the bitmap to SVG using Potrace
    potrace -s -o "$output_svg" "${input_image%.*}.pbm"

    # Clean up the intermediate PBM file
    rm "${input_image%.*}.pbm"

    mv "$output_svg" ~/Pictures/
    echo "~/Pictures/${output_svg}" | xclip -selection clipboard
    echo "Converted $input_image to ~/Pictures/$output_svg"
}
