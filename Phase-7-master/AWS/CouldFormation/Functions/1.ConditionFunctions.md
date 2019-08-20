### If

  Refer: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-if

  ```
  Fn::If: [condition_name, value_if_true, value_if_false]
  ```

  or 

  ```
  !If [condition_name, value_if_true, value_if_false]
  ```

  ex: 

  Ex-1: https://github.com/DevOpsPlatform/Phase-7/blob/master/AWS/CouldFormation/Simple-Examples/CombinedExamples/6.EC2-SG-Conditions.yml

  Ex-2: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/conditions-sample-templates.html
  
### And

  Refer: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-and

  ```Fn::And: [condition]```

  or

  ```!And [condition]```

  Ex: The following MyAndCondition evaluates to true if the referenced security group name is equal to sg-mysggroup and if SomeOtherCondition evaluates to true:

  ```
  MyAndCondition: !And
    - !Equals ["sg-mysggroup", !Ref ASecurityGroup]
    - !Condition SomeOtherCondition
  ```

### Or
  
  Refer: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-or
  
  ```Fn::Or: [condition, ...]```
  
  or
  
  ```!Or [condition, ...]```
  
  Ex: The following MyOrCondition evaluates to true if the referenced security group name is equal to sg-mysggroup or if SomeOtherCondition evaluates to true:

  ```
  MyOrCondition:
    !Or [!Equals [sg-mysggroup, !Ref ASecurityGroup], Condition: SomeOtherCondition]
  ```
  
### Equals

  Refer: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-equals

  ```Fn::Equals: [value_1, value_2]```

  or

  ```!Equals [value_1, value_2]```

  Ex: The following UseProdCondition condition evaluates to true if the value for the EnvironmentType parameter is equal to prod:

  ```
  UseProdCondition:
    !Equals [!Ref EnvironmentType, prod]
  ```

### Not

  Refer: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-not

  ```Fn::Not: [condition]```

  or

  ```!Not [condition]```

  Ex: The following EnvCondition condition evaluates to true if the value for the EnvironmentType parameter is not equal to prod:

  ```
  MyNotCondition:
    !Not [!Equals [!Ref EnvironmentType, prod]]
  ```
