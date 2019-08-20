
### FindInMap

  Refer: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-findinmap.html

  ```Fn::FindInMap: [ MapName, TopLevelKey, SecondLevelKey ]```

  or

  ```!FindInMap [ MapName, TopLevelKey, SecondLevelKey ]```

  ```
  Note

  You can't nest two instances of two functions in short form.
  ```

  Ex-1: https://github.com/DevOpsPlatform/Phase-7/blob/master/AWS/CouldFormation/Simple-Examples/EC2/6.EC2-Mappings.yml

  Ex-2: 
  ```
  Mappings: 
  RegionMap: 
    us-east-1: 
      HVM64: "ami-0ff8a91507f77f867"
      HVMG2: "ami-0a584ac55a7631c0c"
    us-west-1: 
      HVM64: "ami-0bdb828fd58c52235"
      HVMG2: "ami-066ee5fd4a9ef77f1"
    eu-west-1: 
      HVM64: "ami-047bb4163c506cd98"
      HVMG2: "ami-31c2f645"
    ap-southeast-1: 
      HVM64: "ami-08569b978cc4dfa10"
      HVMG2: "ami-0be9df32ae9f92309"
    ap-northeast-1: 
      HVM64: "ami-06cd52961ce9f0d85"
      HVMG2: "ami-053cdd503598e4a9d"
Resources: 
  myEC2Instance: 
    Type: "AWS::EC2::Instance"
    Properties: 
      ImageId: !FindInMap
        - RegionMap
        - !Ref 'AWS::Region'
        - HVM64
      InstanceType: m1.small
  ```
