# Import AMI as disk image from S3

- Ensure your AWS account has the proper VMIE role. If it does not, use the create-role.sh script

```
./create-role.sh <s3 bucket name to allow role operation on>
```

- Upload the disk image file into the same bucket used in the previous step.

- Run the import AMI script passing in the same bucket name and the path to the disk image file

```
./import_content_ami.sh <s3_bucket> <path_to_img_file_in_s3>
```
